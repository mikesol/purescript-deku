module Deku.DOM.Attr.OnDrag where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDrag = OnDrag

instance Attr anything OnDrag Cb where
  pureAttr OnDrag value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "drag", value: cb' value }
  mapAttr OnDrag evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "drag", value: cb' value }

instance Attr anything OnDrag (Effect Unit) where
  pureAttr OnDrag value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "drag", value: cb' (Cb (const (value $> true))) }
  mapAttr OnDrag evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (Effect Boolean) where
  pureAttr OnDrag value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "drag", value: cb' (Cb (const value)) }
  mapAttr OnDrag evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "drag", value: cb' (Cb (const value)) }

type OnDragEffect =
  forall element. Attr element OnDrag (Effect Unit) => Event (Attribute element)

instance Attr everything OnDrag Unit where
  pureAttr OnDrag _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "drag", value: unset' }
  mapAttr OnDrag evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "drag", value: unset' }
