-- | Typelevel declarations for the createSG function
-- | As of PureScript 14.2, this is still necessary in order to
-- | work with `CreateSG` at the type level without incuring term-level computations.
module Deku.CreateSGT where

import Prelude

import Deku.Graph.DOM (Element)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Util (class AddPrefixToRowList)
import Prim.Row as R
import Prim.RowList as RL
import Prim.Symbol as Sym

class
  ConnectT (source :: Symbol) (dest :: Symbol) (i :: Graph) (o :: Graph)
  | source dest i -> o

instance connectTInstance ::
  ( R.Cons from ignore0 ignore1 graphi
  , R.Cons to (NodeC n { | e }) newg graphi
  , R.Lacks from e
  , R.Cons from Unit e e'
  , R.Cons to (NodeC n { | e' }) newg grapho
  ) =>
  ConnectT from to graphi grapho
class
  CreateSGStepT
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | r inGraph -> outGraph

class
  CreateSGStepRLT
    (rl :: RL.RowList Type)
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | rl r inGraph -> outGraph

instance createSGStepTAll ::
  ( RL.RowToList r rl
  , CreateSGStepRLT rl prefix r inGraph outGraph
  ) =>
  CreateSGStepT prefix r inGraph outGraph

instance createSGStepRLTNil :: CreateSGStepRLT RL.Nil prefix r inGraph inGraph

class GetSeparator (i :: Symbol) (o :: Symbol) | i -> o

instance getSeparatorBlank :: GetSeparator "" ""
else instance getSeparator :: GetSeparator anything "."

class GetNodeEdges i node edges | i -> node edges
instance getNodeEdgesElement :: GetNodeEdges (Element node edges) node edges
instance getNodeEdgesMyNameIs :: GetNodeEdges (CTOR.MyNameIs px (Element node edges)) node edges

instance createSGStepRLTCons ::
  ( R.Cons key val ignore r
  , GetNodeEdges val node edges
  , GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA key fullPath
  , CreateSGT' fullPath node graph0 graph1
  , CreateSGStepT fullPath edges graph1 graph2
  , CreateSGStepRLT rest prefix r graph2 graph3
  ) =>
  CreateSGStepRLT (RL.Cons key val rest) prefix r graph0 graph3

class
  ConnectEdgesToNodeT
    (sources :: RL.RowList Type)
    (dest :: Symbol)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | sources dest inGraph -> outGraph

instance connectEdgesToNodeTNil ::
  ConnectEdgesToNodeT RL.Nil dest inGraph inGraph

instance connectEdgesToNodeTCons ::
  ( ConnectT key dest inGraph midGraph
  , ConnectEdgesToNodeT rest dest midGraph outGraph
  ) =>
  ConnectEdgesToNodeT (RL.Cons key ignore rest) dest inGraph outGraph

class
  ConnectAfterCreateSGT
    (prefix :: Symbol)
    (rl :: RL.RowList Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | rl inGraph -> outGraph

instance connectAfterCreateSGTNil ::
  ConnectAfterCreateSGT prefix RL.Nil graph0 graph0

instance connectAfterCreateSGTCons ::
  ( GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA sym fullPath
  , Sym.Append fullPath "." fullPathAsPrefix
  , RL.RowToList edges edgesList
  , AddPrefixToRowList fullPathAsPrefix edgesList oel
  , ConnectEdgesToNodeT oel fullPath graph0 graph1
  , ConnectAfterCreateSGT fullPath edgesList graph1 graph2
  , ConnectAfterCreateSGT prefix rest graph2 graph3
  ) =>
  ConnectAfterCreateSGT prefix
    (RL.Cons sym (Element node edges) rest)
    graph0
    graph3

class
  CreateSGInternalT
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | prefix r inGraph -> outGraph

instance createSGInternalTAll ::
  ( CreateSGStepT prefix r inGraph midGraph
  , RL.RowToList r rl
  , ConnectAfterCreateSGT prefix rl midGraph outGraph
  ) =>
  CreateSGInternalT prefix r inGraph outGraph

class
  CreateSGT (r :: Row Type) (inGraph :: Graph) (outGraph :: Graph)
  | r inGraph -> outGraph

instance createSGTAll ::
  CreateSGInternalT "" r inGraph outGraph =>
  CreateSGT r inGraph outGraph

-- | CreateSG an dom unit `node` in `igraph` with index `ptr`, resulting in `ograph`.
class
  CreateSGT'
    (ptr :: Symbol)
    (node :: Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | ptr node inGraph -> outGraph

instance createSGTUnit ::
  CreateSGT' ptr Unit graphi graphi

instance createSGTText ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TText {}) graphi grapho
  ) =>
  CreateSGT' ptr (CTOR.Text) graphi grapho

instance createSGTSubgraph ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TSubgraph env) {}) graphi grapho
  ) =>
  CreateSGT' ptr
    (CTOR.Subgraph index env push)
    graphi
    grapho

instance createSGTMyNameIs ::
  CreateSGT' name thing graphi grapho =>
  CreateSGT' ptr
    (CTOR.MyNameIs name thing)
    graphi
    grapho

-- codegen 5
instance createSGTA_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.A_ graphi grapho
instance createSGTAbbr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAbbr_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Abbr_ graphi grapho
instance createSGTAcronym_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAcronym_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Acronym_ graphi grapho
instance createSGTAddress_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAddress_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Address_ graphi grapho
instance createSGTApplet_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TApplet_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Applet_ graphi grapho
instance createSGTArea_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArea_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Area_ graphi grapho
instance createSGTArticle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArticle_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Article_ graphi grapho
instance createSGTAside_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAside_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Aside_ graphi grapho
instance createSGTAudio_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAudio_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Audio_ graphi grapho
instance createSGTB_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TB_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.B_ graphi grapho
instance createSGTBase_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBase_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Base_ graphi grapho
instance createSGTBasefont_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBasefont_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Basefont_ graphi grapho
instance createSGTBdi_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdi_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Bdi_ graphi grapho
instance createSGTBdo_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdo_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Bdo_ graphi grapho
instance createSGTBig_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBig_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Big_ graphi grapho
instance createSGTBlockquote_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBlockquote_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Blockquote_ graphi grapho
instance createSGTBody_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBody_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Body_ graphi grapho
instance createSGTBr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBr_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Br_ graphi grapho
instance createSGTButton_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TButton_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Button_ graphi grapho
instance createSGTCanvas_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCanvas_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Canvas_ graphi grapho
instance createSGTCaption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCaption_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Caption_ graphi grapho
instance createSGTCenter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCenter_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Center_ graphi grapho
instance createSGTCite_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCite_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Cite_ graphi grapho
instance createSGTCode_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCode_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Code_ graphi grapho
instance createSGTCol_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCol_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Col_ graphi grapho
instance createSGTColgroup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TColgroup_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Colgroup_ graphi grapho
instance createSGTXdata_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TXdata_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Xdata_ graphi grapho
instance createSGTDatalist_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDatalist_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Datalist_ graphi grapho
instance createSGTDd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDd_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dd_ graphi grapho
instance createSGTDel_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDel_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Del_ graphi grapho
instance createSGTDetails_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDetails_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Details_ graphi grapho
instance createSGTDfn_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDfn_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dfn_ graphi grapho
instance createSGTDialog_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDialog_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dialog_ graphi grapho
instance createSGTDir_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDir_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dir_ graphi grapho
instance createSGTDiv_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDiv_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Div_ graphi grapho
instance createSGTDl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDl_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dl_ graphi grapho
instance createSGTDt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDt_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Dt_ graphi grapho
instance createSGTEm_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEm_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Em_ graphi grapho
instance createSGTEmbed_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEmbed_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Embed_ graphi grapho
instance createSGTFieldset_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFieldset_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Fieldset_ graphi grapho
instance createSGTFigcaption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigcaption_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Figcaption_ graphi grapho
instance createSGTFigure_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigure_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Figure_ graphi grapho
instance createSGTFont_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFont_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Font_ graphi grapho
instance createSGTFooter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFooter_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Footer_ graphi grapho
instance createSGTForm_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TForm_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Form_ graphi grapho
instance createSGTFrame_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrame_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Frame_ graphi grapho
instance createSGTFrameset_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrameset_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Frameset_ graphi grapho
instance createSGTH1_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH1_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H1_ graphi grapho
instance createSGTH2_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH2_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H2_ graphi grapho
instance createSGTH3_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH3_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H3_ graphi grapho
instance createSGTH4_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH4_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H4_ graphi grapho
instance createSGTH5_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH5_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H5_ graphi grapho
instance createSGTH6_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH6_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.H6_ graphi grapho
instance createSGTHead_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THead_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Head_ graphi grapho
instance createSGTHeader_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THeader_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Header_ graphi grapho
instance createSGTHr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THr_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Hr_ graphi grapho
instance createSGTHtml_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THtml_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Html_ graphi grapho
instance createSGTI_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TI_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.I_ graphi grapho
instance createSGTIframe_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIframe_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Iframe_ graphi grapho
instance createSGTImg_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TImg_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Img_ graphi grapho
instance createSGTInput_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TInput_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Input_ graphi grapho
instance createSGTIns_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIns_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Ins_ graphi grapho
instance createSGTKbd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TKbd_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Kbd_ graphi grapho
instance createSGTLabel_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLabel_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Label_ graphi grapho
instance createSGTLegend_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLegend_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Legend_ graphi grapho
instance createSGTLi_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLi_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Li_ graphi grapho
instance createSGTLink_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLink_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Link_ graphi grapho
instance createSGTMain_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMain_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Main_ graphi grapho
instance createSGTMap_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMap_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Map_ graphi grapho
instance createSGTMark_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMark_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Mark_ graphi grapho
instance createSGTMeta_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeta_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Meta_ graphi grapho
instance createSGTMeter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeter_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Meter_ graphi grapho
instance createSGTNav_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNav_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Nav_ graphi grapho
instance createSGTNoframes_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoframes_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Noframes_ graphi grapho
instance createSGTNoscript_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoscript_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Noscript_ graphi grapho
instance createSGTObject_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TObject_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Object_ graphi grapho
instance createSGTOl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOl_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Ol_ graphi grapho
instance createSGTOptgroup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOptgroup_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Optgroup_ graphi grapho
instance createSGTOption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOption_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Option_ graphi grapho
instance createSGTOutput_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOutput_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Output_ graphi grapho
instance createSGTP_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TP_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.P_ graphi grapho
instance createSGTParam_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TParam_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Param_ graphi grapho
instance createSGTPicture_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPicture_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Picture_ graphi grapho
instance createSGTPre_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPre_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Pre_ graphi grapho
instance createSGTProgress_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TProgress_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Progress_ graphi grapho
instance createSGTQ_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TQ_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Q_ graphi grapho
instance createSGTRp_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRp_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Rp_ graphi grapho
instance createSGTRt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRt_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Rt_ graphi grapho
instance createSGTRuby_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRuby_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Ruby_ graphi grapho
instance createSGTS_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TS_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.S_ graphi grapho
instance createSGTSamp_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSamp_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Samp_ graphi grapho
instance createSGTScript_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TScript_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Script_ graphi grapho
instance createSGTSection_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSection_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Section_ graphi grapho
instance createSGTSelect_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSelect_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Select_ graphi grapho
instance createSGTSmall_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSmall_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Small_ graphi grapho
instance createSGTSource_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSource_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Source_ graphi grapho
instance createSGTSpan_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSpan_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Span_ graphi grapho
instance createSGTStrike_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrike_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Strike_ graphi grapho
instance createSGTStrong_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrong_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Strong_ graphi grapho
instance createSGTStyle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStyle_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Style_ graphi grapho
instance createSGTSub_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSub_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Sub_ graphi grapho
instance createSGTSummary_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSummary_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Summary_ graphi grapho
instance createSGTSup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSup_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Sup_ graphi grapho
instance createSGTSvg_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSvg_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Svg_ graphi grapho
instance createSGTTable_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTable_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Table_ graphi grapho
instance createSGTTbody_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTbody_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Tbody_ graphi grapho
instance createSGTTd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTd_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Td_ graphi grapho
instance createSGTTemplate_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTemplate_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Template_ graphi grapho
instance createSGTTextarea_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTextarea_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Textarea_ graphi grapho
instance createSGTTfoot_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTfoot_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Tfoot_ graphi grapho
instance createSGTTh_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTh_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Th_ graphi grapho
instance createSGTThead_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TThead_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Thead_ graphi grapho
instance createSGTTime_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTime_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Time_ graphi grapho
instance createSGTTitle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTitle_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Title_ graphi grapho
instance createSGTTr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTr_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Tr_ graphi grapho
instance createSGTTrack_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTrack_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Track_ graphi grapho
instance createSGTTt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTt_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Tt_ graphi grapho
instance createSGTU_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TU_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.U_ graphi grapho
instance createSGTUl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TUl_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Ul_ graphi grapho
instance createSGTVar_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVar_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Var_ graphi grapho
instance createSGTVideo_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVideo_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Video_ graphi grapho
instance createSGTWbr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TWbr_ {}) graphi grapho
  ) =>
  CreateSGT' ptr CTOR.Wbr_ graphi grapho
-- codegen 5