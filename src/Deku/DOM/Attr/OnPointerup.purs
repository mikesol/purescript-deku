module Deku.DOM.Attr.OnPointerup where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerup = OnPointerup

instance Attr anything OnPointerup Cb where
  pureAttr OnPointerup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' value }
  mapAttr OnPointerup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' value }

instance Attr anything OnPointerup (Effect Unit) where
  pureAttr OnPointerup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointerup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerup (Effect Boolean) where
  pureAttr OnPointerup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' (Cb (const value)) }
  mapAttr OnPointerup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerup", value: cb' (Cb (const value)) }

type OnPointerupEffect =
  forall element
   . Attr element OnPointerup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerup Unit where
  pureAttr OnPointerup _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerup", value: unset' }

  mapAttr OnPointerup evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "pointerup", value: unset' }