(* ::Package:: *)

BeginPackage["PhysicsClusterUSYD`",{"ClusterIntegration`"}]


LaunchCluster::usage="LaunchCluster[nKernelsPerNode_,nodeStart_,nodeEnd_,QueueName_:\"defaultQ\",hours_:168] launches kernels on the cluster."


SilenceCluster::usage="Silences the cluster."


QDel::usage="QDel[start_,end_] terminates rogue jobs on the cluster."


Begin["`Private`"]


DefineLaunchCluster[]:=(Clear[LaunchCluster];LaunchCluster[nKernelsPerNode_,nodeStart_,nodeEnd_,QueueName_:"defaultQ",hours_:168]:=Table[LaunchKernels[PBS[nKernelsPerNode,"EnginePath"->"/usr/physics/pbspro","KernelProgram"->"math","BatchCommand"->"#!/bin/csh \n #PBS -q "<>QueueName<>" -l select=1:host=node"<>IntegerString[i,10,2]<>" -l walltime="<>IntegerString[hours]<>":00:00 -j oe -o /dev/null -N mathkernel -V \n `mathkernel`"]],{i,nodeStart,nodeEnd}])


(* ::Text:: *)
(*Due to a peculiarity with the USYD Physics cluster, one has to launch a failed kernel and run the definition of LaunchCluster a second time before it functions correctly:*)


DefineLaunchCluster[];LaunchCluster[1,22,22,"yossarian"];CloseKernels[];DefineLaunchCluster[]


SilenceCluster[]:=ParallelEvaluate[Off[NIntegrate::zeroregion,NIntegrate::inumr,NIntegrate::ncvb,NIntegrate::slwcon,General::munfl,Power::infy,Infinity::indet,NIntegrate::izero,StableDistribution::posprm,NIntegrate::deoncon,NIntegrate::deorel,NIntegrate::deodiv ,NIntegrate::deorela ]]


QDel[start_,end_]:=Run["for i in $(seq "<>IntegerString@start<>" "<>IntegerString@end<>"); do qdel $i -W force; done"]


End[]


EndPackage[]
