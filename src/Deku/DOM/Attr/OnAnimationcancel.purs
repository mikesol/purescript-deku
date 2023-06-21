module Deku.DOM.Attr.OnAnimationcancel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel Cb where
  pureAttr OnAnimationcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAnimationcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationcancel ", value: cb' value }

instance Attr anything OnAnimationcancel (Effect Unit) where
  pureAttr OnAnimationcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAnimationcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationcancel ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (Effect Boolean) where
  pureAttr OnAnimationcancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAnimationcancel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationcancel ", value: cb' (Cb (const value)) }

type OnAnimationcancelEffect =
  forall element
   . Attr element OnAnimationcancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationcancel Unit where
  pureAttr OnAnimationcancel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationcancel ", value: unset' }
