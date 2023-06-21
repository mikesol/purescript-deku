module Deku.DOM.Attr.OnAnimationiteration where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration Cb where
  pureAttr OnAnimationiteration value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationiteration ", value: cb' value }
  mapAttr OnAnimationiteration evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationiteration ", value: cb' value }

instance Attr anything OnAnimationiteration (Effect Unit) where
  pureAttr OnAnimationiteration value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationiteration ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnAnimationiteration evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationiteration ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationiteration (Effect Boolean) where
  pureAttr OnAnimationiteration value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationiteration ", value: cb' (Cb (const value)) }
  mapAttr OnAnimationiteration evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "animationiteration ", value: cb' (Cb (const value)) }

type OnAnimationiterationEffect =
  forall element
   . Attr element OnAnimationiteration (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationiteration Unit where
  pureAttr OnAnimationiteration _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "animationiteration ", value: unset' }

  mapAttr OnAnimationiteration evalue = unsafeAttribute $ Right $ evalue <#>
    \_ ->
      unsafeVolatileAttribute
        { key: "animationiteration ", value: unset' }