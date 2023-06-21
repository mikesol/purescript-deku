module Deku.DOM.Attr.OnDragenter where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDragenter = OnDragenter

instance Attr anything OnDragenter Cb where
  pureAttr OnDragenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDragenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragenter", value: cb' value }

instance Attr anything OnDragenter (Effect Unit) where
  pureAttr OnDragenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDragenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragenter (Effect Boolean) where
  pureAttr OnDragenter value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDragenter evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragenter", value: cb' (Cb (const value)) }

type OnDragenterEffect =
  forall element
   . Attr element OnDragenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragenter Unit where
  pureAttr OnDragenter _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragenter", value: unset' }
