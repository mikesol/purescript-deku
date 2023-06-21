module Deku.DOM.Attr.OnDragstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDragstart = OnDragstart

instance Attr anything OnDragstart Cb where
  pureAttr OnDragstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' value }
  mapAttr OnDragstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' value }

instance Attr anything OnDragstart (Effect Unit) where
  pureAttr OnDragstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' (Cb (const (value $> true))) }
  mapAttr OnDragstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragstart (Effect Boolean) where
  pureAttr OnDragstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' (Cb (const value)) }
  mapAttr OnDragstart evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragstart", value: cb' (Cb (const value)) }

type OnDragstartEffect =
  forall element
   . Attr element OnDragstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragstart Unit where
  pureAttr OnDragstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragstart", value: unset' }

  mapAttr OnDragstart evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "dragstart", value: unset' }