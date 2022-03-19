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
