-- | Typelevel declarations for the create function
-- | As of PureScript 14.2, this is still necessary in order to
-- | work with `Create` at the type level without incuring term-level computations.
module Deku.CreateT where

import Prelude

import Data.Vec as V
import Deku.Connect (class ConnectT)
import Deku.Graph.DOM (Element)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Util (class AddPrefixToRowList)
import Prim.Row as R
import Prim.RowList as RL
import Prim.Symbol as Sym

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
  ( R.Cons key (Element node edges) ignore r
  , GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA key fullPath
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
  ( GetSeparator prefix separator
  , Sym.Append prefix separator prefixA
  , Sym.Append prefixA sym fullPath
  , Sym.Append fullPath "." fullPathAsPrefix
  , RL.RowToList edges edgesList
  , AddPrefixToRowList fullPathAsPrefix edgesList oel
  , ConnectEdgesToNodeT oel fullPath graph0 graph1
  , ConnectAfterCreateT fullPath edgesList graph1 graph2
  , ConnectAfterCreateT prefix rest graph2 graph3
  ) =>
  ConnectAfterCreateT prefix (RL.Cons sym (Element node edges) rest) graph0 graph3

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

instance createTSubgraph ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TSubgraph n terminus env) {}) graphi grapho
  ) =>
  CreateT' ptr
    (CTOR.Subgraph (CTOR.AsSubgraph terminus env push) (V.Vec n env))
    graphi
    grapho

instance createTTumult ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC (CTOR.TTumult n terminus) {}) graphi grapho
  ) =>
  CreateT' ptr
    (CTOR.Tumult n terminus)
    graphi
    grapho

-------- codegen
instance createTA ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TA {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.A graphi grapho
instance createTAbbr ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAbbr {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Abbr graphi grapho
instance createTAcronym ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAcronym {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Acronym graphi grapho
instance createTAddress ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAddress {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Address graphi grapho
instance createTApplet ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TApplet {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Applet graphi grapho
instance createTArea ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArea {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Area graphi grapho
instance createTArticle ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TArticle {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Article graphi grapho
instance createTAside ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAside {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Aside graphi grapho
instance createTAudio ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TAudio {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Audio graphi grapho
instance createTB ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TB {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.B graphi grapho
instance createTBase ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBase {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Base graphi grapho
instance createTBasefont ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBasefont {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Basefont graphi grapho
instance createTBdi ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdi {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Bdi graphi grapho
instance createTBdo ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBdo {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Bdo graphi grapho
instance createTBig ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBig {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Big graphi grapho
instance createTBlockquote ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBlockquote {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Blockquote graphi grapho
instance createTBody ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBody {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Body graphi grapho
instance createTBr ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TBr {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Br graphi grapho
instance createTButton ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TButton {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Button graphi grapho
instance createTCanvas ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCanvas {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Canvas graphi grapho
instance createTCaption ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCaption {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Caption graphi grapho
instance createTCenter ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCenter {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Center graphi grapho
instance createTCite ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCite {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Cite graphi grapho
instance createTCode ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCode {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Code graphi grapho
instance createTCol ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TCol {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Col graphi grapho
instance createTColgroup ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TColgroup {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Colgroup graphi grapho
instance createTData ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TData {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Data graphi grapho
instance createTDatalist ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDatalist {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Datalist graphi grapho
instance createTDd ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDd {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dd graphi grapho
instance createTDel ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDel {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Del graphi grapho
instance createTDetails ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDetails {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Details graphi grapho
instance createTDfn ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDfn {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dfn graphi grapho
instance createTDialog ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDialog {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dialog graphi grapho
instance createTDir ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDir {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dir graphi grapho
instance createTDiv ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDiv {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Div graphi grapho
instance createTDl ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDl {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dl graphi grapho
instance createTDt ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TDt {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Dt graphi grapho
instance createTEm ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEm {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Em graphi grapho
instance createTEmbed ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TEmbed {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Embed graphi grapho
instance createTFieldset ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFieldset {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Fieldset graphi grapho
instance createTFigcaption ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigcaption {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Figcaption graphi grapho
instance createTFigure ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFigure {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Figure graphi grapho
instance createTFont ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFont {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Font graphi grapho
instance createTFooter ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFooter {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Footer graphi grapho
instance createTForm ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TForm {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Form graphi grapho
instance createTFrame ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrame {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Frame graphi grapho
instance createTFrameset ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TFrameset {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Frameset graphi grapho
instance createTH1 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH1 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H1 graphi grapho
instance createTH2 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH2 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H2 graphi grapho
instance createTH3 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH3 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H3 graphi grapho
instance createTH4 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH4 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H4 graphi grapho
instance createTH5 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH5 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H5 graphi grapho
instance createTH6 ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TH6 {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.H6 graphi grapho
instance createTHead ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THead {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Head graphi grapho
instance createTHeader ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THeader {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Header graphi grapho
instance createTHr ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THr {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Hr graphi grapho
instance createTHtml ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.THtml {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Html graphi grapho
instance createTI ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TI {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.I graphi grapho
instance createTIframe ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIframe {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Iframe graphi grapho
instance createTImg ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TImg {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Img graphi grapho
instance createTInput ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TInput {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Input graphi grapho
instance createTIns ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TIns {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ins graphi grapho
instance createTKbd ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TKbd {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Kbd graphi grapho
instance createTLabel ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLabel {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Label graphi grapho
instance createTLegend ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLegend {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Legend graphi grapho
instance createTLi ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLi {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Li graphi grapho
instance createTLink ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TLink {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Link graphi grapho
instance createTMain ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMain {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Main graphi grapho
instance createTMap ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMap {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Map graphi grapho
instance createTMark ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMark {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Mark graphi grapho
instance createTMeta ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeta {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Meta graphi grapho
instance createTMeter ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TMeter {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Meter graphi grapho
instance createTNav ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNav {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Nav graphi grapho
instance createTNoframes ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoframes {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Noframes graphi grapho
instance createTNoscript ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TNoscript {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Noscript graphi grapho
instance createTObject ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TObject {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Object graphi grapho
instance createTOl ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOl {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ol graphi grapho
instance createTOptgroup ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOptgroup {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Optgroup graphi grapho
instance createTOption ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOption {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Option graphi grapho
instance createTOutput ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TOutput {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Output graphi grapho
instance createTP ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TP {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.P graphi grapho
instance createTParam ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TParam {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Param graphi grapho
instance createTPicture ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPicture {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Picture graphi grapho
instance createTPre ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TPre {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Pre graphi grapho
instance createTProgress ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TProgress {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Progress graphi grapho
instance createTQ ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TQ {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Q graphi grapho
instance createTRp ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRp {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Rp graphi grapho
instance createTRt ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRt {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Rt graphi grapho
instance createTRuby ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TRuby {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ruby graphi grapho
instance createTS ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TS {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.S graphi grapho
instance createTSamp ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSamp {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Samp graphi grapho
instance createTScript ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TScript {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Script graphi grapho
instance createTSection ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSection {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Section graphi grapho
instance createTSelect ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSelect {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Select graphi grapho
instance createTSmall ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSmall {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Small graphi grapho
instance createTSource ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSource {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Source graphi grapho
instance createTSpan ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSpan {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Span graphi grapho
instance createTStrike ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrike {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Strike graphi grapho
instance createTStrong ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStrong {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Strong graphi grapho
instance createTStyle ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TStyle {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Style graphi grapho
instance createTSub ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSub {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Sub graphi grapho
instance createTSummary ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSummary {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Summary graphi grapho
instance createTSup ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSup {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Sup graphi grapho
instance createTSvg ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TSvg {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Svg graphi grapho
instance createTTable ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTable {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Table graphi grapho
instance createTTbody ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTbody {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tbody graphi grapho
instance createTTd ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTd {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Td graphi grapho
instance createTTemplate ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTemplate {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Template graphi grapho
instance createTTextarea ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTextarea {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Textarea graphi grapho
instance createTTfoot ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTfoot {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tfoot graphi grapho
instance createTTh ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTh {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Th graphi grapho
instance createTThead ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TThead {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Thead graphi grapho
instance createTTime ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTime {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Time graphi grapho
instance createTTitle ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTitle {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Title graphi grapho
instance createTTr ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTr {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tr graphi grapho
instance createTTrack ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTrack {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Track graphi grapho
instance createTTt ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TTt {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Tt graphi grapho
instance createTU ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TU {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.U graphi grapho
instance createTUl ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TUl {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Ul graphi grapho
instance createTVar ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVar {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Var graphi grapho
instance createTVideo ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TVideo {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Video graphi grapho
instance createTWbr ::
  ( R.Lacks ptr graphi
  , R.Cons ptr (NodeC CTOR.TWbr {}) graphi grapho
  ) =>
  CreateT' ptr CTOR.Wbr graphi grapho
