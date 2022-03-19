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

------ codegen
instance allNodesAreSaturatedCons_TA ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TA) { | r }) tail)

instance allNodesAreSaturatedCons_TAbbr ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAbbr) { | r }) tail)

instance allNodesAreSaturatedCons_TAcronym ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAcronym) { | r }) tail)

instance allNodesAreSaturatedCons_TAddress ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAddress) { | r }) tail)

instance allNodesAreSaturatedCons_TApplet ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TApplet) { | r }) tail)

instance allNodesAreSaturatedCons_TArea ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TArea) { | r }) tail)

instance allNodesAreSaturatedCons_TArticle ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TArticle) { | r }) tail)

instance allNodesAreSaturatedCons_TAside ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAside) { | r }) tail)

instance allNodesAreSaturatedCons_TAudio ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TAudio) { | r }) tail)

instance allNodesAreSaturatedCons_TB ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TB) { | r }) tail)

instance allNodesAreSaturatedCons_TBase ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBase) { | r }) tail)

instance allNodesAreSaturatedCons_TBasefont ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBasefont) { | r }) tail)

instance allNodesAreSaturatedCons_TBdi ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBdi) { | r }) tail)

instance allNodesAreSaturatedCons_TBdo ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBdo) { | r }) tail)

instance allNodesAreSaturatedCons_TBig ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBig) { | r }) tail)

instance allNodesAreSaturatedCons_TBlockquote ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBlockquote) { | r }) tail)

instance allNodesAreSaturatedCons_TBody ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBody) { | r }) tail)

instance allNodesAreSaturatedCons_TBr ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TBr) { | r }) tail)

instance allNodesAreSaturatedCons_TButton ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TButton) { | r }) tail)

instance allNodesAreSaturatedCons_TCanvas ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCanvas) { | r }) tail)

instance allNodesAreSaturatedCons_TCaption ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCaption) { | r }) tail)

instance allNodesAreSaturatedCons_TCenter ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCenter) { | r }) tail)

instance allNodesAreSaturatedCons_TCite ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCite) { | r }) tail)

instance allNodesAreSaturatedCons_TCode ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCode) { | r }) tail)

instance allNodesAreSaturatedCons_TCol ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TCol) { | r }) tail)

instance allNodesAreSaturatedCons_TColgroup ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TColgroup) { | r }) tail)

instance allNodesAreSaturatedCons_TData ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TData) { | r }) tail)

instance allNodesAreSaturatedCons_TDatalist ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDatalist) { | r }) tail)

instance allNodesAreSaturatedCons_TDd ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDd) { | r }) tail)

instance allNodesAreSaturatedCons_TDel ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDel) { | r }) tail)

instance allNodesAreSaturatedCons_TDetails ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDetails) { | r }) tail)

instance allNodesAreSaturatedCons_TDfn ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDfn) { | r }) tail)

instance allNodesAreSaturatedCons_TDialog ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDialog) { | r }) tail)

instance allNodesAreSaturatedCons_TDir ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDir) { | r }) tail)

instance allNodesAreSaturatedCons_TDiv ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDiv) { | r }) tail)

instance allNodesAreSaturatedCons_TDl ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDl) { | r }) tail)

instance allNodesAreSaturatedCons_TDt ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TDt) { | r }) tail)

instance allNodesAreSaturatedCons_TEm ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TEm) { | r }) tail)

instance allNodesAreSaturatedCons_TEmbed ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TEmbed) { | r }) tail)

instance allNodesAreSaturatedCons_TFieldset ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFieldset) { | r }) tail)

instance allNodesAreSaturatedCons_TFigcaption ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFigcaption) { | r }) tail)

instance allNodesAreSaturatedCons_TFigure ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFigure) { | r }) tail)

instance allNodesAreSaturatedCons_TFont ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFont) { | r }) tail)

instance allNodesAreSaturatedCons_TFooter ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFooter) { | r }) tail)

instance allNodesAreSaturatedCons_TForm ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TForm) { | r }) tail)

instance allNodesAreSaturatedCons_TFrame ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFrame) { | r }) tail)

instance allNodesAreSaturatedCons_TFrameset ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TFrameset) { | r }) tail)

instance allNodesAreSaturatedCons_TH1 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH1) { | r }) tail)

instance allNodesAreSaturatedCons_TH2 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH2) { | r }) tail)

instance allNodesAreSaturatedCons_TH3 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH3) { | r }) tail)

instance allNodesAreSaturatedCons_TH4 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH4) { | r }) tail)

instance allNodesAreSaturatedCons_TH5 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH5) { | r }) tail)

instance allNodesAreSaturatedCons_TH6 ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TH6) { | r }) tail)

instance allNodesAreSaturatedCons_THead ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THead) { | r }) tail)

instance allNodesAreSaturatedCons_THeader ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THeader) { | r }) tail)

instance allNodesAreSaturatedCons_THr ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THr) { | r }) tail)

instance allNodesAreSaturatedCons_THtml ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.THtml) { | r }) tail)

instance allNodesAreSaturatedCons_TI ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TI) { | r }) tail)

instance allNodesAreSaturatedCons_TIframe ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TIframe) { | r }) tail)

instance allNodesAreSaturatedCons_TImg ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TImg) { | r }) tail)

instance allNodesAreSaturatedCons_TInput ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TInput) { | r }) tail)

instance allNodesAreSaturatedCons_TIns ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TIns) { | r }) tail)

instance allNodesAreSaturatedCons_TKbd ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TKbd) { | r }) tail)

instance allNodesAreSaturatedCons_TLabel ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLabel) { | r }) tail)

instance allNodesAreSaturatedCons_TLegend ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLegend) { | r }) tail)

instance allNodesAreSaturatedCons_TLi ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLi) { | r }) tail)

instance allNodesAreSaturatedCons_TLink ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TLink) { | r }) tail)

instance allNodesAreSaturatedCons_TMain ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMain) { | r }) tail)

instance allNodesAreSaturatedCons_TMap ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMap) { | r }) tail)

instance allNodesAreSaturatedCons_TMark ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMark) { | r }) tail)

instance allNodesAreSaturatedCons_TMeta ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMeta) { | r }) tail)

instance allNodesAreSaturatedCons_TMeter ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TMeter) { | r }) tail)

instance allNodesAreSaturatedCons_TNav ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNav) { | r }) tail)

instance allNodesAreSaturatedCons_TNoframes ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNoframes) { | r }) tail)

instance allNodesAreSaturatedCons_TNoscript ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TNoscript) { | r }) tail)

instance allNodesAreSaturatedCons_TObject ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TObject) { | r }) tail)

instance allNodesAreSaturatedCons_TOl ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOl) { | r }) tail)

instance allNodesAreSaturatedCons_TOptgroup ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOptgroup) { | r }) tail)

instance allNodesAreSaturatedCons_TOption ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOption) { | r }) tail)

instance allNodesAreSaturatedCons_TOutput ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TOutput) { | r }) tail)

instance allNodesAreSaturatedCons_TP ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TP) { | r }) tail)

instance allNodesAreSaturatedCons_TParam ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TParam) { | r }) tail)

instance allNodesAreSaturatedCons_TPicture ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TPicture) { | r }) tail)

instance allNodesAreSaturatedCons_TPre ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TPre) { | r }) tail)

instance allNodesAreSaturatedCons_TProgress ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TProgress) { | r }) tail)

instance allNodesAreSaturatedCons_TQ ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TQ) { | r }) tail)

instance allNodesAreSaturatedCons_TRp ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRp) { | r }) tail)

instance allNodesAreSaturatedCons_TRt ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRt) { | r }) tail)

instance allNodesAreSaturatedCons_TRuby ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TRuby) { | r }) tail)

instance allNodesAreSaturatedCons_TS ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TS) { | r }) tail)

instance allNodesAreSaturatedCons_TSamp ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSamp) { | r }) tail)

instance allNodesAreSaturatedCons_TScript ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TScript) { | r }) tail)

instance allNodesAreSaturatedCons_TSection ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSection) { | r }) tail)

instance allNodesAreSaturatedCons_TSelect ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSelect) { | r }) tail)

instance allNodesAreSaturatedCons_TSmall ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSmall) { | r }) tail)

instance allNodesAreSaturatedCons_TSource ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSource) { | r }) tail)

instance allNodesAreSaturatedCons_TSpan ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSpan) { | r }) tail)

instance allNodesAreSaturatedCons_TStrike ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStrike) { | r }) tail)

instance allNodesAreSaturatedCons_TStrong ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStrong) { | r }) tail)

instance allNodesAreSaturatedCons_TStyle ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TStyle) { | r }) tail)

instance allNodesAreSaturatedCons_TSub ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSub) { | r }) tail)

instance allNodesAreSaturatedCons_TSummary ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSummary) { | r }) tail)

instance allNodesAreSaturatedCons_TSup ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSup) { | r }) tail)

instance allNodesAreSaturatedCons_TSvg ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TSvg) { | r }) tail)

instance allNodesAreSaturatedCons_TTable ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTable) { | r }) tail)

instance allNodesAreSaturatedCons_TTbody ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTbody) { | r }) tail)

instance allNodesAreSaturatedCons_TTd ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTd) { | r }) tail)

instance allNodesAreSaturatedCons_TTemplate ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTemplate) { | r }) tail)

instance allNodesAreSaturatedCons_TTextarea ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTextarea) { | r }) tail)

instance allNodesAreSaturatedCons_TTfoot ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTfoot) { | r }) tail)

instance allNodesAreSaturatedCons_TTh ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTh) { | r }) tail)

instance allNodesAreSaturatedCons_TThead ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TThead) { | r }) tail)

instance allNodesAreSaturatedCons_TTime ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTime) { | r }) tail)

instance allNodesAreSaturatedCons_TTitle ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTitle) { | r }) tail)

instance allNodesAreSaturatedCons_TTr ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTr) { | r }) tail)

instance allNodesAreSaturatedCons_TTrack ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTrack) { | r }) tail)

instance allNodesAreSaturatedCons_TTt ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TTt) { | r }) tail)

instance allNodesAreSaturatedCons_TU ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TU) { | r }) tail)

instance allNodesAreSaturatedCons_TUl ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TUl) { | r }) tail)

instance allNodesAreSaturatedCons_TVar ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TVar) { | r }) tail)

instance allNodesAreSaturatedCons_TVideo ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TVideo) { | r }) tail)

instance allNodesAreSaturatedCons_TWbr ::
  AllNodesAreSaturatedNL tail =>
  AllNodesAreSaturatedNL (RL.Cons iSym (NodeC (CTOR.TWbr) { | r }) tail)
