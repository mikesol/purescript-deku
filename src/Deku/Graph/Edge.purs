module Deku.Graph.Edge where

import Prim.RowList (RowList)

-- | A row of edges going into a node.
type Edges = Row Type

-- | A list of edges going into a node.
type EdgeList = RowList Type