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
