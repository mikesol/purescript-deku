-- | Low-level, fine-grained control of attributes. For more high-level functions, see
-- | [Deku.Attributes](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Attributes).
-- | In this module, you'll find functions to set and unset attributes and listeners on elements.
-- | There's also the `xdata` function that allows you to construct an aribitrary data attribute.
module Deku.Attribute
  ( AttributeValue(..)
  , VolatileAttribute
  , UnsafeAttribute
  , Attribute(..)
  , PureAttribute(..)
  , class Attr
  , biAttr
  , (<**>)
  , unsafeUnAttribute
  , unsafeAttribute
  , unsafeUnPureAttribute
  , unsafePureAttribute
  , prop'
  , cb'
  , unset'
  , cb
  , Cb(..)
  , xdata
  , xdata_
  , pureAttr
  , (!:=)
  , mapAttr
  , (<:=>)
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Newtype (class Newtype)
import Effect (Effect)
import FRP.Event as FRP
import Safe.Coerce (coerce)
import Web.Event.Internal.Types (Event)

-- | A callback function that can be used as a value for a listener.
newtype Cb = Cb (Event -> Effect Boolean)

derive instance newtypeCb :: Newtype Cb _
instance eqCb :: Eq Cb where
  eq _ _ = false

instance ordCb :: Ord Cb where
  compare _ _ = LT

instance showCb :: Show Cb where
  show _ = "{callback}"

-- | Construct a `cb`. This is an alias for the newtype constructor.
cb :: (Event -> Effect Unit) -> Cb
cb = Cb <<< ((map <<< map) (const true))

-- | Construct a property attribute value.
-- | In general, this function is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
prop' :: String -> AttributeValue
prop' = Prop'

-- | Construct a callback for a listener.
-- | In general, this function is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `click` and `keyUp` instead.
cb' :: Cb -> AttributeValue
cb' = Cb'

-- | Unset an attribute. You should not use this directly but rather
-- | you can set a value to `unit` to unset it, which calls
-- | `unset'` under the hood.
-- |
-- | For example, to set an ID and then unset it two seconds later,
-- | you could do the following:
-- |
-- | ```purescript
-- | id_ "foo" <|> delay 2000 (D.Id !:= unit)
-- | ```
unset' :: AttributeValue
unset' = Unset'

-- | Low-level constructor for attributes and listeners, including their unsetting.
-- | In general, these constructors are for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
data AttributeValue = Prop' String | Cb' Cb | Unset'

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype Attribute (e :: Type) = Attribute UnsafeAttribute

type UnsafeAttribute = Either PureAttribute (FRP.Event VolatileAttribute)

newtype VolatileAttribute= VolatileAttribute
  { key :: String
  , value :: AttributeValue
  }

newtype PureAttribute = PureAttribute
  { key :: String, value :: String }

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute
  :: VolatileAttribute -> { key :: String, value :: AttributeValue }
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: { key :: String, value :: AttributeValue } -> VolatileAttribute
unsafeAttribute = VolatileAttribute

unsafeUnPureAttribute
  :: PureAttribute -> { key :: String, value :: String }
unsafeUnPureAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafePureAttribute
  :: { key :: String, value :: String } -> PureAttribute
unsafePureAttribute = PureAttribute

-- | Guarantees type-safe creation of attribute `a` with type `b` for element `e`.
-- | Guards against elements having incorrect attributes set, for example prohibiting
-- | the setting of `style` as a `Boolean`, etc.
class Attr e a b where
  -- | A version of `attr` that maps a value to an attribute or listener.
  -- | More commonly used in its alias `<:=>`.
  mapAttr :: a -> FRP.Event b -> Attribute e
  -- | A version of `attr` that creates a `pure` event fired immediately
  -- | upon the element's creation. More commonly used in its alias `!:=`,
  pureAttr :: a -> b -> Attribute e
  -- | A function, almost never used, for the theoretically possible case 
  -- | where the attribute name changes as well
  biAttr :: FRP.Event a -> FRP.Event b -> Attribute e

infixr 5 pureAttr as !:=
infix 5 mapAttr as <:=>
infix 5 biAttr as <**>

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> FRP.Event String -> Attribute e
xdata k v = Attribute $ Right $ v <#> \v' -> unsafeAttribute { key: "data-" <> k, value: Prop' v' }

-- | Construct an unchanging [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata_ :: forall e. String -> String -> Attribute e
xdata_ k v = Attribute $ Left $ unsafePureAttribute { key: "data-" <> k, value: v }
