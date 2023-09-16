-- | Low-level, fine-grained control of attributes. For more high-level functions, see
-- | [Deku.Attributes](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Attributes).
-- | In this module, you'll find functions to set and unset attributes and listeners on elements.
-- | There's also the `xdata` function that allows you to construct an aribitrary data attribute.
module Deku.Attribute
  ( AttributeValue(..)
  , Attribute
  , Attribute'
  , Key(..)
  , Value(..)
  , unsafeUnAttribute
  , unsafeAttribute
  , prop'
  , cb'
  , unset'
  , cb
  , Cb(..)
  , xdata
  ) where

import Prelude

import Data.Newtype (class Newtype)
import Data.Variant (Variant, inj)
import Effect (Effect)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Web.Event.Internal.Types (Event)

-- | A callback function that can be used as a value for a listener.
newtype Key = Key String
newtype Value = Value String
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
prop' p = AttributeValue $ inj (Proxy :: _ "prop") p

-- | Construct a callback for a listener.
-- | In general, this function is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `click` and `keyUp` instead.
cb' :: Cb -> AttributeValue
cb' c = AttributeValue $ inj (Proxy :: _ "cb") c

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
unset' = AttributeValue $ inj (Proxy :: _ "unset") unit

-- | Low-level constructor for attributes and listeners, including their unsetting.
-- | In general, these constructors are for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype AttributeValue = AttributeValue (Variant (prop :: String, cb :: Cb, unset :: Unit))

type Attribute' =
  { key :: String
  , value :: AttributeValue
  }

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype Attribute :: forall k. k -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute
  :: forall e. Attribute e -> { key :: String, value :: AttributeValue }
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: forall e. { key :: String, value :: AttributeValue } -> Attribute e
unsafeAttribute = Attribute

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> String -> Attribute e
xdata k v = unsafeAttribute { key: "data-" <> k, value: AttributeValue $ inj (Proxy :: _ "prop") v }
