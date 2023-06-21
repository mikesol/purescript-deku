module Deku.DOM.Attr.OnDragend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDragend = OnDragend

instance Attr anything OnDragend Cb where
  pureAttr OnDragend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "dragend", value: cb' value }
  mapAttr OnDragend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dragend", value: cb' value }

instance Attr anything OnDragend (Effect Unit) where
  pureAttr OnDragend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragend", value: cb' (Cb (const (value $> true))) }
  mapAttr OnDragend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (Effect Boolean) where
  pureAttr OnDragend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragend", value: cb' (Cb (const value)) }
  mapAttr OnDragend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragend", value: cb' (Cb (const value)) }

type OnDragendEffect =
  forall element
   . Attr element OnDragend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragend Unit where
  pureAttr OnDragend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragend", value: unset' }

  mapAttr OnDragend evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "dragend", value: unset' }