(* ::Package:: *)

BeginPackage["DataHelper`"]
ImportRel::usage = "ImportRel[source] imports data from source (relative path)."
ExportPlot::usage = "ExportPlot[name, plot] exports the specified plot as a PDF to the \"Plots\" subfolder."
ValueOfAround::usage = "ValueOfAround[expr] gets the values from Around quanities in expr."
UncertOfAround::usage = "UncertOfAround[expr] get the uncertainties from Around quantities in expr."
Begin["`Private`"]

ImportRel[source_] := Import[NotebookDirectory[] <> source]

ExportPlot[name_, plot_] :=
    Block[{dir = NotebookDirectory[] <> "Plots"},
        If[!DirectoryQ[dir],
            CreateDirectory[dir]
        ];
        Export[dir <> "\\" <> name <> ".pdf"]
    ]

ValueOfAround[expr_Around] := expr["Value"]
ValueOfAround[expr_List] := ValueOfAround /@ expr
ValueOfAround[expr_] := expr

UncertOfAround[expr_Around] := expr["Uncertainty"]
UncertOfAround[expr_List] := UncertOfAround /@ expr
UncertOfAround[expr_] := 0

End[]
EndPackage[]
