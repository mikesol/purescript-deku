-- | Typelevel declarations for the create function
-- | As of PureScript 14.2, this is still necessary in order to
-- | work with `Create` at the type level without incuring term-level computations.
module Deku.CreateT where

import Prelude

import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Pursx (Pursx)
import Deku.Util (class AddPrefixToRowList, class GetNodeEdges, class Gate)
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
  CreateStepT
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | r inGraph -> outGraph

class
  CreateStepRLT
    (rl :: RL.RowList Type)
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | rl r inGraph -> outGraph

instance createStepTAll ::
  ( RL.RowToList r rl
  , CreateStepRLT rl prefix r inGraph outGraph
  ) =>
  CreateStepT prefix r inGraph outGraph

instance createStepRLTNil :: CreateStepRLT RL.Nil prefix r inGraph inGraph

class GetSeparator (i :: Symbol) (o :: Symbol) | i -> o

instance getSeparatorBlank :: GetSeparator "" ""
else instance getSeparator :: GetSeparator anything "."

instance createStepRLTCons ::
  ( R.Cons key val ignore r
  , GetNodeEdges val tf pfx node edges
  , GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA key fullPath'
  , Gate tf pfx fullPath' fullPath
  , CreateT' fullPath node graph0 graph1
  , CreateStepT fullPath edges graph1 graph2
  , CreateStepRLT rest prefix r graph2 graph3
  ) =>
  CreateStepRLT (RL.Cons key val rest) prefix r graph0 graph3

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
  ConnectAfterCreateT
    (prefix :: Symbol)
    (rl :: RL.RowList Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | rl inGraph -> outGraph

instance connectAfterCreateTNil ::
  ConnectAfterCreateT prefix RL.Nil graph0 graph0

instance connectAfterCreateTCons ::
  ( GetNodeEdges val tf pfx node edges
  , GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA sym fullPath'
  , Gate tf pfx fullPath' fullPath
  , Sym.Append fullPath "." fullPathAsPrefix
  , RL.RowToList edges edgesList
  , AddPrefixToRowList fullPathAsPrefix edgesList oel
  , ConnectEdgesToNodeT oel fullPath graph0 graph1
  , ConnectAfterCreateT fullPath edgesList graph1 graph2
  , ConnectAfterCreateT prefix rest graph2 graph3
  ) =>
  ConnectAfterCreateT prefix
    (RL.Cons sym val rest)
    graph0
    graph3

class
  CreateInternalT
    (prefix :: Symbol)
    (r :: Row Type)
    (inGraph :: Graph)
    (outGraph :: Graph)
  | prefix r inGraph -> outGraph

instance createInternalTAll ::
  ( CreateStepT prefix r inGraph midGraph
  , RL.RowToList r rl
  , ConnectAfterCreateT prefix rl midGraph outGraph
  ) =>
  CreateInternalT prefix r inGraph outGraph

class
  CreateT (r :: Row Type) (inGraph :: Graph) (outGraph :: Graph)
  | r inGraph -> outGraph

instance createTAll ::
  CreateInternalT "" r inGraph outGraph =>
  CreateT r inGraph outGraph

-- | Create an dom unit `node` in `igraph` with index `ptr`, resulting in `ograph`.
class
  CreateT' (ptr :: Symbol) (node :: Type) (inGraph :: Graph) (outGraph :: Graph)
  | ptr node inGraph -> outGraph

instance createTUnit ::
  CreateT' ptr Unit graphi graphi

instance createTRoot ::
  ( R.Lacks "root" graphi
  , R.Cons "root" (NodeC CTOR.TRoot {}) graphi grapho
  ) =>
  CreateT' "root" (CTOR.Root) graphi grapho

instance createTText ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TText {}) graphi grapho
  ) =>
  CreateT' ptr (CTOR.Text) graphi grapho

instance createTPursx ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC (Pursx verb html children) {}) graphi grapho
  ) =>
  CreateT' ptr (Pursx verb html children) graphi grapho

instance createTSubgraph ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TSubgraph env) {}) graphi grapho
  ) =>
  CreateT' ptr
    (CTOR.Subgraph index env push)
    graphi
    grapho

-- codegen 3
instance createTA_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.A_ graphi grapho
instance createTAbbr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAbbr_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Abbr_ graphi grapho
instance createTAcronym_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAcronym_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Acronym_ graphi grapho
instance createTAddress_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAddress_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Address_ graphi grapho
instance createTApplet_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TApplet_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Applet_ graphi grapho
instance createTArea_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArea_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Area_ graphi grapho
instance createTArticle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArticle_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Article_ graphi grapho
instance createTAside_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAside_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Aside_ graphi grapho
instance createTAudio_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAudio_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Audio_ graphi grapho
instance createTB_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TB_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.B_ graphi grapho
instance createTBase_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBase_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Base_ graphi grapho
instance createTBasefont_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBasefont_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Basefont_ graphi grapho
instance createTBdi_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdi_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Bdi_ graphi grapho
instance createTBdo_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdo_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Bdo_ graphi grapho
instance createTBig_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBig_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Big_ graphi grapho
instance createTBlockquote_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBlockquote_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Blockquote_ graphi grapho
instance createTBody_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBody_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Body_ graphi grapho
instance createTBr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBr_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Br_ graphi grapho
instance createTButton_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TButton_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Button_ graphi grapho
instance createTCanvas_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCanvas_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Canvas_ graphi grapho
instance createTCaption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCaption_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Caption_ graphi grapho
instance createTCenter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCenter_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Center_ graphi grapho
instance createTCite_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCite_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Cite_ graphi grapho
instance createTCode_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCode_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Code_ graphi grapho
instance createTCol_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCol_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Col_ graphi grapho
instance createTColgroup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TColgroup_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Colgroup_ graphi grapho
instance createTXdata_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TXdata_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Xdata_ graphi grapho
instance createTDatalist_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDatalist_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Datalist_ graphi grapho
instance createTDd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDd_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dd_ graphi grapho
instance createTDel_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDel_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Del_ graphi grapho
instance createTDetails_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDetails_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Details_ graphi grapho
instance createTDfn_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDfn_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dfn_ graphi grapho
instance createTDialog_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDialog_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dialog_ graphi grapho
instance createTDir_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDir_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dir_ graphi grapho
instance createTDiv_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDiv_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Div_ graphi grapho
instance createTDl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDl_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dl_ graphi grapho
instance createTDt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDt_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dt_ graphi grapho
instance createTEm_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEm_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Em_ graphi grapho
instance createTEmbed_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEmbed_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Embed_ graphi grapho
instance createTFieldset_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFieldset_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Fieldset_ graphi grapho
instance createTFigcaption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigcaption_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Figcaption_ graphi grapho
instance createTFigure_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigure_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Figure_ graphi grapho
instance createTFont_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFont_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Font_ graphi grapho
instance createTFooter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFooter_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Footer_ graphi grapho
instance createTForm_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TForm_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Form_ graphi grapho
instance createTFrame_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrame_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Frame_ graphi grapho
instance createTFrameset_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrameset_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Frameset_ graphi grapho
instance createTH1_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH1_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H1_ graphi grapho
instance createTH2_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH2_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H2_ graphi grapho
instance createTH3_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH3_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H3_ graphi grapho
instance createTH4_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH4_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H4_ graphi grapho
instance createTH5_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH5_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H5_ graphi grapho
instance createTH6_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH6_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H6_ graphi grapho
instance createTHead_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THead_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Head_ graphi grapho
instance createTHeader_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THeader_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Header_ graphi grapho
instance createTHr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THr_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Hr_ graphi grapho
instance createTHtml_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THtml_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Html_ graphi grapho
instance createTI_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TI_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.I_ graphi grapho
instance createTIframe_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIframe_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Iframe_ graphi grapho
instance createTImg_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TImg_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Img_ graphi grapho
instance createTInput_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TInput_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Input_ graphi grapho
instance createTIns_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIns_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ins_ graphi grapho
instance createTKbd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TKbd_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Kbd_ graphi grapho
instance createTLabel_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLabel_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Label_ graphi grapho
instance createTLegend_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLegend_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Legend_ graphi grapho
instance createTLi_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLi_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Li_ graphi grapho
instance createTLink_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLink_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Link_ graphi grapho
instance createTMain_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMain_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Main_ graphi grapho
instance createTMap_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMap_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Map_ graphi grapho
instance createTMark_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMark_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Mark_ graphi grapho
instance createTMeta_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeta_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Meta_ graphi grapho
instance createTMeter_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeter_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Meter_ graphi grapho
instance createTNav_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNav_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Nav_ graphi grapho
instance createTNoframes_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoframes_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Noframes_ graphi grapho
instance createTNoscript_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoscript_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Noscript_ graphi grapho
instance createTObject_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TObject_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Object_ graphi grapho
instance createTOl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOl_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ol_ graphi grapho
instance createTOptgroup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOptgroup_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Optgroup_ graphi grapho
instance createTOption_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOption_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Option_ graphi grapho
instance createTOutput_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOutput_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Output_ graphi grapho
instance createTP_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TP_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.P_ graphi grapho
instance createTParam_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TParam_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Param_ graphi grapho
instance createTPicture_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPicture_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Picture_ graphi grapho
instance createTPre_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPre_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Pre_ graphi grapho
instance createTProgress_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TProgress_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Progress_ graphi grapho
instance createTQ_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TQ_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Q_ graphi grapho
instance createTRp_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRp_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Rp_ graphi grapho
instance createTRt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRt_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Rt_ graphi grapho
instance createTRuby_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRuby_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ruby_ graphi grapho
instance createTS_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TS_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.S_ graphi grapho
instance createTSamp_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSamp_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Samp_ graphi grapho
instance createTScript_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TScript_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Script_ graphi grapho
instance createTSection_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSection_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Section_ graphi grapho
instance createTSelect_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSelect_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Select_ graphi grapho
instance createTSmall_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSmall_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Small_ graphi grapho
instance createTSource_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSource_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Source_ graphi grapho
instance createTSpan_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSpan_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Span_ graphi grapho
instance createTStrike_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrike_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Strike_ graphi grapho
instance createTStrong_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrong_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Strong_ graphi grapho
instance createTStyle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStyle_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Style_ graphi grapho
instance createTSub_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSub_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Sub_ graphi grapho
instance createTSummary_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSummary_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Summary_ graphi grapho
instance createTSup_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSup_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Sup_ graphi grapho
instance createTSvg_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSvg_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Svg_ graphi grapho
instance createTTable_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTable_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Table_ graphi grapho
instance createTTbody_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTbody_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tbody_ graphi grapho
instance createTTd_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTd_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Td_ graphi grapho
instance createTTemplate_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTemplate_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Template_ graphi grapho
instance createTTextarea_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTextarea_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Textarea_ graphi grapho
instance createTTfoot_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTfoot_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tfoot_ graphi grapho
instance createTTh_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTh_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Th_ graphi grapho
instance createTThead_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TThead_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Thead_ graphi grapho
instance createTTime_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTime_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Time_ graphi grapho
instance createTTitle_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTitle_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Title_ graphi grapho
instance createTTr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTr_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tr_ graphi grapho
instance createTTrack_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTrack_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Track_ graphi grapho
instance createTTt_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTt_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tt_ graphi grapho
instance createTU_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TU_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.U_ graphi grapho
instance createTUl_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TUl_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ul_ graphi grapho
instance createTVar_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVar_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Var_ graphi grapho
instance createTVideo_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVideo_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Video_ graphi grapho
instance createTWbr_ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TWbr_ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Wbr_ graphi grapho
-- codegen 3