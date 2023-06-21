module Deku.DOM.Attr.OnPointerover where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerover = OnPointerover

instance Attr anything OnPointerover Cb where
  pureAttr OnPointerover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' value }
  mapAttr OnPointerover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (Effect Unit) where
  pureAttr OnPointerover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointerover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (Effect Boolean) where
  pureAttr OnPointerover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' (Cb (const value)) }
  mapAttr OnPointerover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerover", value: cb' (Cb (const value)) }

type OnPointeroverEffect =
  forall element
   . Attr element OnPointerover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerover Unit where
  pureAttr OnPointerover _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerover", value: unset' }

  mapAttr OnPointerover evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "pointerover", value: unset' }