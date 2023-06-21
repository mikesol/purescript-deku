module Deku.DOM.Attr.OnAnimationstart where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart Cb where
  pureAttr OnAnimationstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationstart ", value: cb' value }
  mapAttr OnAnimationstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationstart ", value: cb' value }

instance Attr anything OnAnimationstart (Effect Unit) where
  pureAttr OnAnimationstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationstart ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnAnimationstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationstart ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (Effect Boolean) where
  pureAttr OnAnimationstart value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationstart ", value: cb' (Cb (const value)) }
  mapAttr OnAnimationstart evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationstart ", value: cb' (Cb (const value)) }

type OnAnimationstartEffect =
  forall element
   . Attr element OnAnimationstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationstart Unit where
  pureAttr OnAnimationstart _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationstart ", value: unset' }

  mapAttr OnAnimationstart evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "animationstart ", value: unset' }