module Deku.PathWalkerPrimitives where


import Effect.Uncurried (EffectFn2, EffectFn3)
import Web.DOM (Element, Text)
import Web.DOM.Node as Node

data MElement

foreign import mEltElt :: MElement -> Element
foreign import mEltify :: Node.Node -> MElement
foreign import mEltParent :: MElement -> Element
foreign import returnReplacementNoIndex :: EffectFn3 String String MElement Text
foreign import returnReplacement :: EffectFn2 Int  MElement Node.Node
foreign import returnReplacementIndex :: EffectFn3 String String MElement Int
