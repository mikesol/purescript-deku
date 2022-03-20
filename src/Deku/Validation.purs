-- | Validation algorithms for dom graphs.
-- |
-- | Validation includes making sure the graph is renderable by
-- | the web dom API and retrieving information about valid graphs,
-- | like their terminal node (ie a loudspeaker).
module Deku.Validation where

import Prelude hiding (Ordering(..))

import Data.Tuple.Nested (type (/\))
import Data.Typelevel.Bool (False, True)
import Deku.Graph.DOM as CTOR
import Deku.Graph.Edge (EdgeList)
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC, NodeList)
import Deku.Util (class Gate, class RowListEmpty, class SymInRowList)
import Prim.Row (class Nub)
import Prim.Row as R
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Prim.TypeError (class Fail, Text)

-- | Asserts that an dom graph is renderable.
-- |
-- | Every time that `makeScene` is called, we assert that the graph is
-- | renderable. This means that it can be played by the WebDOM API
-- | without any runtime errors. Note that this assertion is a
-- | _compile time_ assertion and not a _runtime_ assertion. This means that,
-- | when your program is compiled, it is guaranteed to be renderable by
-- | the WebDOM API _assuming that_ it is within the memory constraints
-- | of a given browser and computer. Usually, these memory limits are not
-- | hit unless one has hundreds of active nodes.
class GraphIsRenderable (graph :: Graph)

instance graphIsRenderable ::
  ( NoNodesAreDuplicated graph
  , AllEdgesPointToNodes graph
  , NoParallelEdges graph
  , HasSourceNodes graph
  , UniqueTerminus graph name terminus
  , NodeIsRootNode terminus
  , AllNodesAreSaturated graph
  , R.Cons "root" ignore graphWithoutRoot graph
  , NoNodesAreRoots graphWithoutRoot
  , NodesOnlyAppearOnce graph name
  ) =>
  GraphIsRenderable graph

-- | Asserts that a subgraph is renderable.
-- |
-- | Subgraphs are exactly like graphs with the exception that the node _cannot_ be a
-- | speaker.

class
  SubgraphIsRenderable
    (graph :: Graph)
    (terminusName :: Symbol)
  | graph -> terminusName

instance subgraphIsRenderable ::
  ( NoNodesAreDuplicated graph
  , AllEdgesPointToNodes graph
  , NoParallelEdges graph
  , HasSourceNodes graph
  , UniqueTerminus graph name terminus
  , NoNodesAreRoots graph
  , AllNodesAreSaturated graph
  , NodesOnlyAppearOnce graph name
  ) =>
  SubgraphIsRenderable graph name

-- | Retrieves the terminal node from an dom grpah. This is
-- | almost always a speaker or recording, but if the graph is
-- | at an intermediary stage of construction, this could be another
-- | top-level node, ie a gain node.
class TerminalNodeC (g :: Graph) (ptr :: Symbol) | g -> ptr

instance terminalNodeC ::
  ( UniqueTerminus g sym t
  ) =>
  TerminalNodeC g sym

class NoNodesAreDuplicated (graph :: Graph)

instance noNodesAreDuplicated :: Nub graph graph => NoNodesAreDuplicated graph

-- | Assert that all edges are present as nodes in a graph
class AllEdgesInGraph' (edgeProfile :: EdgeList) (graph :: Graph)

instance allEdgesInGraph'Nil :: AllEdgesInGraph' RL.Nil graph

instance allEdgesInGraph'Cons ::
  ( R.Cons sym node graph' graph
  , AllEdgesInGraph' rest graph
  ) =>
  AllEdgesInGraph' (RL.Cons sym Unit rest) graph

-- | Assert that all edges are present as nodes in a graph
class AllEdgesInGraph (graphAsList :: NodeList) (graph :: Graph)

instance allEdgesInGraphNil :: AllEdgesInGraph RL.Nil graph

instance allEdgesInGraphCons ::
  ( RowToList edges edges'
  , AllEdgesInGraph' edges' graph
  , AllEdgesInGraph rest graph
  ) =>
  AllEdgesInGraph (RL.Cons sym (NodeC node { | edges }) rest) graph

-- | Assertion that all edges in the graph point to a node in the graph.
class AllEdgesPointToNodes (graph :: Graph)

instance allEdgesPointToNodes ::
  ( RowToList graph nodeList
  , AllEdgesInGraph nodeList graph
  ) =>
  AllEdgesPointToNodes graph

-- | Assertion that `nodeList` contains no parallel edges. Parallel edges are two or more edges from `node1` to `node2` in a list of nodes.
class NoParallelEdgesNL (nodeList :: NodeList)

instance noParallelEdgesNLNil :: NoParallelEdgesNL RL.Nil

instance noParallelEdgesNLConsManyEdges ::
  Nub r r =>
  NoParallelEdgesNL (RL.Cons h (NodeC n { | r }) tail)

-- | Assertion that `graph` contains no parallel edges. Parallel edges are two or more edges from `node1` to `node2` in a list of nodes.
class NoParallelEdges (graph :: Graph)

instance noParallelEdges ::
  ( RowToList graph nodeList
  , NoParallelEdgesNL nodeList
  ) =>
  NoParallelEdges graph

-- | Tail-recursive lookup of all nodes in a graph without incoming edges.
-- | - `nodeList` is the list of nodes that will be searched over.
-- | - `output` contains all nodes without incoming edges.
class
  SourceNodes (nodeList :: NodeList) (output :: NodeList)
  | nodeList -> output

instance sourceNodesNil :: SourceNodes RL.Nil RL.Nil

instance sourceNodesConsNil ::
  ( RowToList edges edges'
  , RowListEmpty edges' tf
  , SourceNodes rest out'
  , Gate tf (RL.Cons sym (NodeC node { | edges }) out') out' out
  ) =>
  SourceNodes (RL.Cons sym (NodeC node { | edges }) rest) out

-- | Assertion that a graph has source nodes. Source nodes are nodes without incoming edges.
class HasSourceNodes (graph :: Graph)

instance hasSourceNodes ::
  ( RowToList graph graph'
  , SourceNodes graph' (RL.Cons a b c)
  ) =>
  HasSourceNodes graph

class
  SymPresentInAtLeastOneEdge
    (tf :: Type)
    (sym :: Symbol)
    (graphAsList :: RowList Type)
    (o :: Type)
  | tf sym graphAsList -> o

instance symPresentInAtLeastOneEdgeTrue ::
  SymPresentInAtLeastOneEdge True sym graphAsList True

instance symPresentInAtLeastOneEdgeNil ::
  SymPresentInAtLeastOneEdge False sym RL.Nil False

instance symPresentInAtLeastOneEdgeCons ::
  ( RowToList edges edges'
  , SymInRowList sym edges' tf
  , SymPresentInAtLeastOneEdge tf sym rest o
  ) =>
  SymPresentInAtLeastOneEdge False
    sym
    (RL.Cons sym' (NodeC node { | edges }) rest)
    o

-- | The algorithm that finds the terminal nodes of a graph.
class
  GetTerminii
    (toVisit :: NodeList)
    (graphAsNodeList :: NodeList)
    (output :: NodeList)
  | toVisit graphAsNodeList -> output

instance getTerminiiNil :: GetTerminii RL.Nil graphAsNodeList RL.Nil

instance getTerminiiCons ::
  ( SymPresentInAtLeastOneEdge False sym graphAsList tf
  , GetTerminii rest graphAsList o
  , Gate tf o (RL.Cons sym node o) oo
  ) =>
  GetTerminii (RL.Cons sym node rest) graphAsList oo

-- | Assertion that `graph` has the unique terminus `node`. Note that,
-- | due to the fundep, the assertion also _finds_ the unique terminus
-- | if it exists.
class
  UniqueTerminus (graph :: Graph) (sym :: Symbol) (node :: Type)
  | graph -> sym node

instance uniqueTerminus ::
  ( RowToList graph graphAsList
  , GetTerminii graphAsList graphAsList (RL.Cons sym node RL.Nil)
  ) =>
  UniqueTerminus graph sym node

-- | Assertion that `graph` has a unique terminus.
class HasUniqueTerminus (graph :: Graph)

instance hasUniqueTerminus ::
  UniqueTerminus graph sym node =>
  HasUniqueTerminus graph

-- | Asserts that all nodes in `graph` are saturated.
-- | "Saturation" for dom nodes is similar to the concept of saturation
-- | in types, namely that they have all the information necessary to
-- | render. In doing so, it also fails the assertion on degenerate nodes,
-- | ie sine-wave oscillators with input (which wouldn't make sense).
class AllNodesAreSaturatedNL (graph :: NodeList)

instance allNodesAreSaturatedNil :: AllNodesAreSaturatedNL RL.Nil

instance allNodesAreSaturatedConsTSubgraph::
  ( RowToList r RL.Nil
  , AllNodesAreSaturatedNL tail
  ) =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSubgraph arity terminus env) { | r }) tail)

instance allNodesAreSaturatedConsTTumult::
  ( RowToList r RL.Nil
  , AllNodesAreSaturatedNL tail
  ) =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTumult arity terminus) { | r }) tail)

instance allNodesAreSaturatedCons_TRoot ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRoot) { | r }) tail)

instance allNodesAreSaturatedConsTText ::
  ( RowToList r RL.Nil
  , AllNodesAreSaturatedNL tail
  ) =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TText) { | r }) tail)

-- | Asserts that all nodes in `graph` are saturated. This is
-- | the same as the node-list algorithm, but for a graph.
class AllNodesAreSaturated (graph :: Graph)

instance allNodesAreSaturated ::
  ( RowToList graph nodeList
  , AllNodesAreSaturatedNL nodeList
  ) =>
  AllNodesAreSaturated graph

--
class NodeIsRootNode (node :: Type)

instance nodeIsRootNodeTSpeaker ::
  NodeIsRootNode (NodeC (CTOR.TRoot) x)

class NoNodesAreRoots (graph :: Graph)

instance noNodesAreRoots :: (RL.RowToList graph gl, NoNodesAreRootsRL gl) => NoNodesAreRoots graph

class NoNodesAreRootsRL (graph :: RL.RowList Type)

instance nodeIsNotRootNodeRest :: NoNodesAreRootsRL RL.Nil
else instance nodeIsNotRootNodeRoot ::
  Fail (Text "Roots are not allowed anywhere except at the top of a non-sub-graph") => NoNodesAreRootsRL (RL.Cons sym (NodeC (CTOR.TRoot) x) rest)
else instance nodeIsNotRootNodeRootRest ::
  NoNodesAreRootsRL rest => NoNodesAreRootsRL (RL.Cons sym x rest)

--
class NodesOnlyAppearOnce (graph :: Graph) (terminus :: Symbol)

instance nodesOnlyAppearOnce ::
  ( NodesOnlyAppearOnceI graph sym r'
  , R.Cons sym Unit r' r
  , R.Nub r r
  ) =>
  NodesOnlyAppearOnce graph sym

class NodesOnlyAppearOnceI (graph :: Graph) (terminus :: Symbol) (r :: Row Type) | graph terminus -> r

instance nodesOnlyAppearOnceI ::
  (  R.Cons sym (ignore /\ {|newRow}) r' graph
  , RL.RowToList newRow newRowList
  , NodesOnlyAppearOnceRL graph newRowList r
  ) =>
  NodesOnlyAppearOnceI graph sym r

class NodesOnlyAppearOnceRL (graph :: Graph) (rl :: RowList Type) (r :: Row Type) | graph rl -> r

instance nodesOnlyAppearOnceRLNil ::
  NodesOnlyAppearOnceRL graph RL.Nil ()

instance nodesOnlyAppearOnceRLCons ::
  ( NodesOnlyAppearOnceI graph sym ri
  , NodesOnlyAppearOnceRL graph rest rrl
  , R.Union ri rrl rr
  , R.Cons sym Unit rr r
  ) =>
  NodesOnlyAppearOnceRL graph (RL.Cons sym ignore rest) r
--
class NodeCanBeTumultuous (node :: Type)

instance nodeCanBeTumultuousSubgraph ::
  Fail (Text "Subgraph cannot be tumultuous") =>
  NodeCanBeTumultuous (CTOR.TSubgraph a b c)
else instance nodeCanBeTumultuousTumult ::
  Fail (Text "Tumult cannot be tumultuous") =>
  NodeCanBeTumultuous (CTOR.TTumult a b)
else instance nodeCanBeTumultuousTumultAll :: NodeCanBeTumultuous node

class NodesCanBeTumultuous (rl :: RowList Type)

instance nodesCanBeTumultuousNil :: NodesCanBeTumultuous RL.Nil
instance nodesCanBeTumultuousCons ::
  ( NodeCanBeTumultuous node
  , NodesCanBeTumultuous rest
  ) =>
  NodesCanBeTumultuous (RL.Cons sym (NodeC node { | edges }) rest)

-- codegen 6
instance allNodesAreSaturatedCons_TA_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TA_) { | r }) tail)

instance allNodesAreSaturatedCons_TAbbr_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAbbr_) { | r }) tail)

instance allNodesAreSaturatedCons_TAcronym_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAcronym_) { | r }) tail)

instance allNodesAreSaturatedCons_TAddress_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAddress_) { | r }) tail)

instance allNodesAreSaturatedCons_TApplet_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TApplet_) { | r }) tail)

instance allNodesAreSaturatedCons_TArea_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TArea_) { | r }) tail)

instance allNodesAreSaturatedCons_TArticle_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TArticle_) { | r }) tail)

instance allNodesAreSaturatedCons_TAside_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAside_) { | r }) tail)

instance allNodesAreSaturatedCons_TAudio_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAudio_) { | r }) tail)

instance allNodesAreSaturatedCons_TB_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TB_) { | r }) tail)

instance allNodesAreSaturatedCons_TBase_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBase_) { | r }) tail)

instance allNodesAreSaturatedCons_TBasefont_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBasefont_) { | r }) tail)

instance allNodesAreSaturatedCons_TBdi_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBdi_) { | r }) tail)

instance allNodesAreSaturatedCons_TBdo_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBdo_) { | r }) tail)

instance allNodesAreSaturatedCons_TBig_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBig_) { | r }) tail)

instance allNodesAreSaturatedCons_TBlockquote_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBlockquote_) { | r }) tail)

instance allNodesAreSaturatedCons_TBody_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBody_) { | r }) tail)

instance allNodesAreSaturatedCons_TBr_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBr_) { | r }) tail)

instance allNodesAreSaturatedCons_TButton_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TButton_) { | r }) tail)

instance allNodesAreSaturatedCons_TCanvas_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCanvas_) { | r }) tail)

instance allNodesAreSaturatedCons_TCaption_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCaption_) { | r }) tail)

instance allNodesAreSaturatedCons_TCenter_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCenter_) { | r }) tail)

instance allNodesAreSaturatedCons_TCite_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCite_) { | r }) tail)

instance allNodesAreSaturatedCons_TCode_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCode_) { | r }) tail)

instance allNodesAreSaturatedCons_TCol_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCol_) { | r }) tail)

instance allNodesAreSaturatedCons_TColgroup_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TColgroup_) { | r }) tail)

instance allNodesAreSaturatedCons_TXdata_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TXdata_) { | r }) tail)

instance allNodesAreSaturatedCons_TDatalist_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDatalist_) { | r }) tail)

instance allNodesAreSaturatedCons_TDd_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDd_) { | r }) tail)

instance allNodesAreSaturatedCons_TDel_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDel_) { | r }) tail)

instance allNodesAreSaturatedCons_TDetails_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDetails_) { | r }) tail)

instance allNodesAreSaturatedCons_TDfn_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDfn_) { | r }) tail)

instance allNodesAreSaturatedCons_TDialog_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDialog_) { | r }) tail)

instance allNodesAreSaturatedCons_TDir_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDir_) { | r }) tail)

instance allNodesAreSaturatedCons_TDiv_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDiv_) { | r }) tail)

instance allNodesAreSaturatedCons_TDl_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDl_) { | r }) tail)

instance allNodesAreSaturatedCons_TDt_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDt_) { | r }) tail)

instance allNodesAreSaturatedCons_TEm_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TEm_) { | r }) tail)

instance allNodesAreSaturatedCons_TEmbed_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TEmbed_) { | r }) tail)

instance allNodesAreSaturatedCons_TFieldset_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFieldset_) { | r }) tail)

instance allNodesAreSaturatedCons_TFigcaption_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFigcaption_) { | r }) tail)

instance allNodesAreSaturatedCons_TFigure_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFigure_) { | r }) tail)

instance allNodesAreSaturatedCons_TFont_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFont_) { | r }) tail)

instance allNodesAreSaturatedCons_TFooter_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFooter_) { | r }) tail)

instance allNodesAreSaturatedCons_TForm_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TForm_) { | r }) tail)

instance allNodesAreSaturatedCons_TFrame_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFrame_) { | r }) tail)

instance allNodesAreSaturatedCons_TFrameset_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFrameset_) { | r }) tail)

instance allNodesAreSaturatedCons_TH1_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH1_) { | r }) tail)

instance allNodesAreSaturatedCons_TH2_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH2_) { | r }) tail)

instance allNodesAreSaturatedCons_TH3_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH3_) { | r }) tail)

instance allNodesAreSaturatedCons_TH4_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH4_) { | r }) tail)

instance allNodesAreSaturatedCons_TH5_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH5_) { | r }) tail)

instance allNodesAreSaturatedCons_TH6_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH6_) { | r }) tail)

instance allNodesAreSaturatedCons_THead_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THead_) { | r }) tail)

instance allNodesAreSaturatedCons_THeader_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THeader_) { | r }) tail)

instance allNodesAreSaturatedCons_THr_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THr_) { | r }) tail)

instance allNodesAreSaturatedCons_THtml_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THtml_) { | r }) tail)

instance allNodesAreSaturatedCons_TI_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TI_) { | r }) tail)

instance allNodesAreSaturatedCons_TIframe_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TIframe_) { | r }) tail)

instance allNodesAreSaturatedCons_TImg_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TImg_) { | r }) tail)

instance allNodesAreSaturatedCons_TInput_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TInput_) { | r }) tail)

instance allNodesAreSaturatedCons_TIns_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TIns_) { | r }) tail)

instance allNodesAreSaturatedCons_TKbd_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TKbd_) { | r }) tail)

instance allNodesAreSaturatedCons_TLabel_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLabel_) { | r }) tail)

instance allNodesAreSaturatedCons_TLegend_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLegend_) { | r }) tail)

instance allNodesAreSaturatedCons_TLi_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLi_) { | r }) tail)

instance allNodesAreSaturatedCons_TLink_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLink_) { | r }) tail)

instance allNodesAreSaturatedCons_TMain_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMain_) { | r }) tail)

instance allNodesAreSaturatedCons_TMap_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMap_) { | r }) tail)

instance allNodesAreSaturatedCons_TMark_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMark_) { | r }) tail)

instance allNodesAreSaturatedCons_TMeta_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMeta_) { | r }) tail)

instance allNodesAreSaturatedCons_TMeter_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMeter_) { | r }) tail)

instance allNodesAreSaturatedCons_TNav_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNav_) { | r }) tail)

instance allNodesAreSaturatedCons_TNoframes_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNoframes_) { | r }) tail)

instance allNodesAreSaturatedCons_TNoscript_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNoscript_) { | r }) tail)

instance allNodesAreSaturatedCons_TObject_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TObject_) { | r }) tail)

instance allNodesAreSaturatedCons_TOl_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOl_) { | r }) tail)

instance allNodesAreSaturatedCons_TOptgroup_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOptgroup_) { | r }) tail)

instance allNodesAreSaturatedCons_TOption_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOption_) { | r }) tail)

instance allNodesAreSaturatedCons_TOutput_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOutput_) { | r }) tail)

instance allNodesAreSaturatedCons_TP_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TP_) { | r }) tail)

instance allNodesAreSaturatedCons_TParam_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TParam_) { | r }) tail)

instance allNodesAreSaturatedCons_TPicture_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TPicture_) { | r }) tail)

instance allNodesAreSaturatedCons_TPre_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TPre_) { | r }) tail)

instance allNodesAreSaturatedCons_TProgress_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TProgress_) { | r }) tail)

instance allNodesAreSaturatedCons_TQ_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TQ_) { | r }) tail)

instance allNodesAreSaturatedCons_TRp_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRp_) { | r }) tail)

instance allNodesAreSaturatedCons_TRt_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRt_) { | r }) tail)

instance allNodesAreSaturatedCons_TRuby_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRuby_) { | r }) tail)

instance allNodesAreSaturatedCons_TS_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TS_) { | r }) tail)

instance allNodesAreSaturatedCons_TSamp_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSamp_) { | r }) tail)

instance allNodesAreSaturatedCons_TScript_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TScript_) { | r }) tail)

instance allNodesAreSaturatedCons_TSection_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSection_) { | r }) tail)

instance allNodesAreSaturatedCons_TSelect_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSelect_) { | r }) tail)

instance allNodesAreSaturatedCons_TSmall_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSmall_) { | r }) tail)

instance allNodesAreSaturatedCons_TSource_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSource_) { | r }) tail)

instance allNodesAreSaturatedCons_TSpan_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSpan_) { | r }) tail)

instance allNodesAreSaturatedCons_TStrike_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStrike_) { | r }) tail)

instance allNodesAreSaturatedCons_TStrong_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStrong_) { | r }) tail)

instance allNodesAreSaturatedCons_TStyle_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStyle_) { | r }) tail)

instance allNodesAreSaturatedCons_TSub_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSub_) { | r }) tail)

instance allNodesAreSaturatedCons_TSummary_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSummary_) { | r }) tail)

instance allNodesAreSaturatedCons_TSup_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSup_) { | r }) tail)

instance allNodesAreSaturatedCons_TSvg_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSvg_) { | r }) tail)

instance allNodesAreSaturatedCons_TTable_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTable_) { | r }) tail)

instance allNodesAreSaturatedCons_TTbody_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTbody_) { | r }) tail)

instance allNodesAreSaturatedCons_TTd_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTd_) { | r }) tail)

instance allNodesAreSaturatedCons_TTemplate_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTemplate_) { | r }) tail)

instance allNodesAreSaturatedCons_TTextarea_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTextarea_) { | r }) tail)

instance allNodesAreSaturatedCons_TTfoot_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTfoot_) { | r }) tail)

instance allNodesAreSaturatedCons_TTh_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTh_) { | r }) tail)

instance allNodesAreSaturatedCons_TThead_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TThead_) { | r }) tail)

instance allNodesAreSaturatedCons_TTime_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTime_) { | r }) tail)

instance allNodesAreSaturatedCons_TTitle_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTitle_) { | r }) tail)

instance allNodesAreSaturatedCons_TTr_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTr_) { | r }) tail)

instance allNodesAreSaturatedCons_TTrack_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTrack_) { | r }) tail)

instance allNodesAreSaturatedCons_TTt_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTt_) { | r }) tail)

instance allNodesAreSaturatedCons_TU_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TU_) { | r }) tail)

instance allNodesAreSaturatedCons_TUl_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TUl_) { | r }) tail)

instance allNodesAreSaturatedCons_TVar_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TVar_) { | r }) tail)

instance allNodesAreSaturatedCons_TVideo_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TVideo_) { | r }) tail)

instance allNodesAreSaturatedCons_TWbr_ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TWbr_) { | r }) tail)

-- codegen 6