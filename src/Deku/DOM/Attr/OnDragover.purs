module Deku.DOM.Attr.OnDragover where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDragover = OnDragover

instance Attr anything OnDragover Cb where
  pureAttr OnDragover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "dragover", value: cb' value }
  mapAttr OnDragover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dragover", value: cb' value }

instance Attr anything OnDragover (Effect Unit) where
  pureAttr OnDragover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragover", value: cb' (Cb (const (value $> true))) }
  mapAttr OnDragover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (Effect Boolean) where
  pureAttr OnDragover value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragover", value: cb' (Cb (const value)) }
  mapAttr OnDragover evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragover", value: cb' (Cb (const value)) }

type OnDragoverEffect =
  forall element
   . Attr element OnDragover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragover Unit where
  pureAttr OnDragover _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragover", value: unset' }

  mapAttr OnDragover evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "dragover", value: unset' }