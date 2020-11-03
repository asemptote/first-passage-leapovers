(* ::Package:: *)

BeginPackage["Figures`"]


Subfigure::usage="Stylises the plot for publication."


Figure::usage="Creates a publication figure out of multiple subfigures."


Begin["`Private`"]


ClearAll[Subfigure];Options[Subfigure]={ImageSize->400,Number->None}~Join~Options[Show];Subfigure[xlabel_,ylabel_,opt:OptionsPattern[]]:=Subfigure[xlabel,ylabel,#,opt]&;Subfigure[xlabel_,ylabel_,plots__,opt:OptionsPattern[]]:=Show[plots,Frame->True,FrameLabel->(Style[#,16,Black]&/@{xlabel,ylabel,If[OptionValue[Number]=!=None,Pane["("<>Alphabet[][[OptionValue[Number]]]<>")",Alignment->Left,ImageSize->OptionValue[ImageSize]-50],""]}),FrameTicksStyle->Black,ImageSize->OptionValue[ImageSize],opt]


ClearAll[Figure];Options[Figure]={ImageSize->400,"Gap"->1/10}~Join~Options[GraphicsRow];Figure[xlabels_,ylabels_,opt:OptionsPattern[]]:=Figure[#,xlabels,ylabels,opt]&;Figure[subfigs_,xlabels_,ylabels_,opt:OptionsPattern[]]:=GraphicsRow[Apply@Subfigure/@Transpose@{xlabels,ylabels,subfigs,Number->#&/@Range@Length@xlabels},Spacings->-OptionValue[ImageSize]*OptionValue["Gap"],ImageSize->OptionValue[ImageSize]*Length[subfigs]]


End[]


EndPackage[]
