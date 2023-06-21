module Deku.DOM.Attr.OnPlaying where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPlaying = OnPlaying

instance Attr anything OnPlaying Cb where
  pureAttr OnPlaying value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "playing", value: cb' value }
  mapAttr OnPlaying evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "playing", value: cb' value }

instance Attr anything OnPlaying (Effect Unit) where
  pureAttr OnPlaying value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "playing", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPlaying evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (Effect Boolean) where
  pureAttr OnPlaying value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "playing", value: cb' (Cb (const value)) }
  mapAttr OnPlaying evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "playing", value: cb' (Cb (const value)) }

type OnPlayingEffect =
  forall element
   . Attr element OnPlaying (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPlaying Unit where
  pureAttr OnPlaying _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "playing", value: unset' }

  mapAttr OnPlaying evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "playing", value: unset' }