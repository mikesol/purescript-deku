module Deku.DOM.Attr.OnAnimationend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend Cb where
  pureAttr OnAnimationend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' value }
  mapAttr OnAnimationend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' value }

instance Attr anything OnAnimationend (Effect Unit) where
  pureAttr OnAnimationend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnAnimationend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (Effect Boolean) where
  pureAttr OnAnimationend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' (Cb (const value)) }
  mapAttr OnAnimationend evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "animationend ", value: cb' (Cb (const value)) }

type OnAnimationendEffect =
  forall element
   . Attr element OnAnimationend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationend Unit where
  pureAttr OnAnimationend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationend ", value: unset' }

  mapAttr OnAnimationend evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "animationend ", value: unset' }