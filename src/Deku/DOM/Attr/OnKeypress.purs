module Deku.DOM.Attr.OnKeypress where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnKeypress = OnKeypress

instance Attr anything OnKeypress Cb where
  pureAttr OnKeypress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "keypress", value: cb' value }
  mapAttr OnKeypress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keypress", value: cb' value }

instance Attr anything OnKeypress (Effect Unit) where
  pureAttr OnKeypress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnKeypress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keypress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeypress (Effect Boolean) where
  pureAttr OnKeypress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnKeypress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keypress", value: cb' (Cb (const value)) }

type OnKeypressEffect =
  forall element
   . Attr element OnKeypress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeypress Unit where
  pureAttr OnKeypress _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keypress", value: unset' }
