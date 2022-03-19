module Deku.Graph.DOM
  ( Element
  , unsafeUnElement
  , class TypeToSym
  , AsSubgraph(..)
  , unAsSubGraph
  , (:=)
  , class Attr
  , attr
  , Text
  , TText
  , text
  , unsafeUnText
  , Root
  , TRoot
  , root
  , unsafeUnRoot
  , Subgraph
  , TSubgraph
  , subgraph
  , unsafeUnSubgraph
  , XSubgraph'
  , XSubgraph(..)
  , Tumult
  , TTumult
  , tumult
  , unsafeUnTumult
  ---- codegen
  , Id(..)
  , Href(..)
  , Click(..)
  , A
  , TA
  , a
  , a'attr
  , unsafeUnA
  ) where

import Prelude

import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple.Nested (type (/\))
import Data.Typelevel.Num (class Pos)
import Data.Vec (Vec)
import Deku.Control.Types (Frame0, SubScene)
import Deku.Graph.Attribute (Attribute, Cb, cb, prop, unsafeAttribute)
import Deku.Interpret (class DOMInterpret)
import Deku.Tumult (Tumultuous)
import Type.Proxy (Proxy(..))
import Web.DOM as Web.DOM

class TypeToSym (a :: Type) (b :: Symbol) | a -> b

instance typeToSymTup :: TypeToSym a c => TypeToSym (a /\ b) c

type Element' element children =
  (element :: element, children :: { | children })
newtype Element element children =
  Element { | Element' element children }
unsafeUnElement
  :: forall element children
   . Element element children
  -> { | Element' element children }
unsafeUnElement (Element unsafe) = unsafe

class Attr e a b where
  attr :: a -> b -> Attribute e

infixr 5 attr as :=

makeElt
  :: forall tag children attributes
   . ( { attributes :: attributes
       , tag :: String
       }
       -> tag
     )
  -> attributes
  -> { | children }
  -> Element tag children
makeElt elt = compose Element
  <<< { element: _, children: _ }
  <<< elt
  <<< { tag: "a", attributes: _ }
--------- other
type Root' = (element :: Web.DOM.Element)
newtype Root = Root { | Root' }
unsafeUnRoot :: Root -> { | Root' }
unsafeUnRoot (Root unsafe) = unsafe

instance typeToSymRoot ::
  TypeToSym Root "Root"

root
  :: forall children
   . Web.DOM.Element
  -> { | children }
  -> { root :: Element Root children }
root = compose ({ root: _ } <<< Element)
  <<< { element: _, children: _ }
  <<< Root
  <<< { element: _ }

type Text' = (text :: String)
newtype Text = Text { | Text' }
unsafeUnText :: Text -> { | Text' }
unsafeUnText (Text unsafe) = unsafe

instance typeToSymText ::
  TypeToSym Text "TEXT"

text
  :: String -> Element Text ()
text = Element
  <<< { element: _, children: {} }
  <<< Text
  <<< { text: _ }

--

newtype AsSubgraph terminus env push = AsSubgraph
  ( forall dom engine
     . DOMInterpret dom engine
    => Int
    -> SubScene terminus env dom engine Frame0 push Unit
  )

unAsSubGraph
  :: forall terminus env push
   . AsSubgraph terminus env push
  -> ( forall dom engine
        . DOMInterpret dom engine
       => Int
       -> SubScene terminus env dom engine Frame0 push Unit
     )
unAsSubGraph (AsSubgraph sg) = sg

type Subgraph' subgraphMaker envs =
  ( subgraphMaker :: subgraphMaker
  , envs :: envs
  , terminus :: String
  )
newtype Subgraph subgraphMaker envs = Subgraph
  { | Subgraph' subgraphMaker envs }

subgraph
  :: forall n env terminus push
   . IsSymbol terminus
  => Pos n
  => Vec n env
  -> AsSubgraph terminus env push
  -> Element (Subgraph (AsSubgraph terminus env push) (Vec n env)) ()
subgraph envs subgraphMaker =
  Element
    { element: Subgraph
        { subgraphMaker, envs, terminus: reflectSymbol (Proxy :: _ terminus) }
    , children: {}
    }

unsafeUnSubgraph
  :: forall subgraphMaker envs
   . Subgraph subgraphMaker envs
  -> { | Subgraph' subgraphMaker envs }
unsafeUnSubgraph (Subgraph unsafe) = unsafe

type XSubgraph' (index :: Type) (env :: Type) =
  (index :: index, env :: env)
newtype XSubgraph index env = XSubgraph { | XSubgraph' index env }

instance typeToSymSubgraph ::
  TypeToSym (Subgraph subgraphMaker env) "Subgraph"

instance typeToSymXSubgraph ::
  TypeToSym (XSubgraph index env) "Subgraph"

type Tumult' (n :: Type) (terminus :: Symbol) =
  ( tumult :: Tumultuous n terminus
  , terminus :: String
  )
newtype Tumult n terminus = Tumult
  { | Tumult' n terminus }

tumult
  :: forall n terminus
   . IsSymbol terminus
  => Tumultuous n terminus
  -> Element (Tumult n terminus) ()
tumult tumultuous = Element
  { element: Tumult
      { terminus: reflectSymbol (Proxy :: _ terminus)
      , tumult: tumultuous
      }
  , children: {}
  }

unsafeUnTumult
  :: forall n terminus
   . Tumult n terminus
  -> { | Tumult' n terminus }
unsafeUnTumult (Tumult unsafe) = unsafe

instance typeToSymTumult :: TypeToSym (Tumult n terminus) "Tumult"

class ReifyAU a b | a -> b where
  reifyAU :: a -> b
----------

-- | Type-level constructor for a subgraph.
data TSubgraph
  (arity :: Type)
  (terminus :: Symbol)
  (env :: Type) = TSubgraph

instance typeToSymTSubgraph ::
  TypeToSym (TSubgraph arity terminus env) "TSubgraph"

instance semigroupTSubgraph :: Semigroup (TSubgraph arity terminus env) where
  append _ _ = TSubgraph

instance monoidTSubgraph :: Monoid (TSubgraph arity terminus env) where
  mempty = TSubgraph

instance reifyTSubgraph :: ReifyAU (Subgraph a b) (TSubgraph x y z) where
  reifyAU = const mempty

-- | Type-level constructor for a subgraph.
data TTumult (arity :: Type) (terminus :: Symbol) = TTumult

instance typeToSymTTumult :: TypeToSym (TTumult arity terminus) "TTumult"

instance semigroupTTumult :: Semigroup (TTumult arity terminus) where
  append _ _ = TTumult

instance monoidTTumult :: Monoid (TTumult arity terminus) where
  mempty = TTumult

instance reifyTTumult :: ReifyAU (Tumult n terminus) (TTumult w x) where
  reifyAU = const mempty

data TText = TText

instance typeToSymTText :: TypeToSym TText "TText"

instance semigroupTText :: Semigroup TText where
  append _ _ = TText

instance monoidTText :: Monoid TText where
  mempty = TText

instance reifyTText :: ReifyAU Text TText where
  reifyAU = const mempty

data TRoot = TRoot

instance typeToSymTRoot :: TypeToSym TRoot "TRoot"

instance semigroupTRoot :: Semigroup TRoot where
  append _ _ = TRoot

instance monoidTRoot :: Monoid TRoot where
  mempty = TRoot

instance reifyTRoot :: ReifyAU Root TRoot where
  reifyAU = const mempty

--------- codegen
---- attrs
data Id = Id
data Href = Href
data Click = Click

-- A
type A' =
  ( tag :: String
  , attributes :: Array (Attribute A)
  )
newtype A = A { | A' }
unsafeUnA :: A -> { | A' }
unsafeUnA (A unsafe) = unsafe

instance typeToSymA ::
  TypeToSym A "a"

instance Attr A Id String where
  attr Id value = unsafeAttribute { key: "id", value: prop value }

instance Attr A Href String where
  attr Href value = unsafeAttribute { key: "href", value: prop value }

instance Attr A Click Cb where
  attr Click value = unsafeAttribute { key: "click", value: cb value }

a
  :: forall children
   . Array (Attribute A)
  -> { | children }
  -> Element A children
a = makeElt A

a'attr
  :: Array (Attribute A)
  -> Array (Attribute A)
a'attr = identity

data TA = TA

instance typeToSymTA :: TypeToSym TA "TA"

instance semigroupTA :: Semigroup TA where
  append _ _ = TA

instance monoidTA :: Monoid TA where
  mempty = TA

instance reifyTA :: ReifyAU A TA where
  reifyAU = const mempty