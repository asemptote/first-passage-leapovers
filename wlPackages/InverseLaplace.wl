(* ::Package:: *)

BeginPackage["InverseLaplace`"]


InverseLaplace::usage="An optimised implementation of the CME algorithm described in inverselaplace.org"


InverseLaplaceParameters::usage="Sets the parameters used by InverseLaplace[...]."


Begin["`Private`"]


cmeParams = Import[With[{path=FileNameJoin[{NotebookDirectory[],"iltcme.json"}]},If[FileExistsQ@path,path,"https://github.com/ghorvath78/iltcme/raw/master/iltcme.json"]]]


InverseLaplaceParameters[maxFnEvals_,prec_:MachinePrecision]:=Module[{params},params = cmeParams[[1]];
For[i=2,i<Length[cmeParams],i++,If[("cv2"/.cmeParams[[i]]) <("cv2"/.params) &&("n"+1 /.cmeParams[[i]])<=maxFnEvals,params=cmeParams[[i]];]];cme\[Eta]=SetPrecision[Prepend["a"*"mu1"+I*"b"*"mu1"/.params,"c"*"mu1"/.params],prec];cme\[Beta]=SetPrecision[Prepend[1+I * "omega"*Range["n"/.params],1]*"mu1" /.params,prec];]


InverseLaplaceParameters[20]


InverseLaplace[fun_,t_]:=Re[Total[cme\[Eta] fun/@(cme\[Beta]/t)]/t]


End[]


EndPackage[]
