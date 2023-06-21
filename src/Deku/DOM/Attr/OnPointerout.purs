module Deku.DOM.Attr.OnPointerout where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerout = OnPointerout

instance Attr anything OnPointerout Cb where
  pureAttr OnPointerout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (Effect Unit) where
  pureAttr OnPointerout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (Effect Boolean) where
  pureAttr OnPointerout value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPointerout evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerout", value: cb' (Cb (const value)) }

type OnPointeroutEffect =
  forall element
   . Attr element OnPointerout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerout Unit where
  pureAttr OnPointerout _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerout", value: unset' }
