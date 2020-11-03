(* ::Package:: *)

(* ::Text:: *)
(*This package works optimally in version 12, but is compatible with version 11.3 (with differing expanded icon details).*)


BeginPackage["BinaryIcon`"]


BinaryIcon::usage="Similar to BinarySerialize, but produces a named icon and executes BinaryDeserialize upon evaluation"


Begin["`Private`"]


If[$VersionNumber<12.0,Clear[Iconize12];Options[Iconize12]={Method->Automatic};With[{rules={Automatic->Table[Identity,2],BinarySerialize->{BinarySerialize,BinaryDeserialize},Compress->{Compress,Uncompress}}},Iconize12[expr_,name_,OptionsPattern[]]:=With[{packed=First[OptionValue[Method]/.rules]@expr,unpack=Last[OptionValue[Method]/.rules]},Iconize[Unevaluated@unpack@packed,name]]]]


With[{IconizeFunction=If[$VersionNumber>=12.0,Iconize,Iconize12]},BinaryIcon[name_]:=IconizeFunction[#,name,Method->BinarySerialize]&]


End[]


EndPackage[]
