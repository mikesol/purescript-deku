module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerdown = OnPointerdown

instance Attr anything OnPointerdown Cb where
  pureAttr OnPointerdown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' value }
  mapAttr OnPointerdown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (Effect Unit) where
  pureAttr OnPointerdown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointerdown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (Effect Boolean) where
  pureAttr OnPointerdown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' (Cb (const value)) }
  mapAttr OnPointerdown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointerdown", value: cb' (Cb (const value)) }

type OnPointerdownEffect =
  forall element
   . Attr element OnPointerdown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerdown Unit where
  pureAttr OnPointerdown _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerdown", value: unset' }

  mapAttr OnPointerdown evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "pointerdown", value: unset' }