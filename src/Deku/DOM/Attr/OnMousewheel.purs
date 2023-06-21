module Deku.DOM.Attr.OnMousewheel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnMousewheel = OnMousewheel

instance Attr anything OnMousewheel Cb where
  pureAttr OnMousewheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' value }
  mapAttr OnMousewheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' value }

instance Attr anything OnMousewheel (Effect Unit) where
  pureAttr OnMousewheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' (Cb (const (value $> true))) }
  mapAttr OnMousewheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousewheel (Effect Boolean) where
  pureAttr OnMousewheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' (Cb (const value)) }
  mapAttr OnMousewheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "mousewheel", value: cb' (Cb (const value)) }

type OnMousewheelEffect =
  forall element
   . Attr element OnMousewheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousewheel Unit where
  pureAttr OnMousewheel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "mousewheel", value: unset' }

  mapAttr OnMousewheel evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "mousewheel", value: unset' }