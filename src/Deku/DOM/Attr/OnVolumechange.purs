module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange Cb where
  pureAttr OnVolumechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "volumechange", value: cb' value }
  mapAttr OnVolumechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (Effect Unit) where
  pureAttr OnVolumechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "volumechange", value: cb' (Cb (const (value $> true))) }
  mapAttr OnVolumechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (Effect Boolean) where
  pureAttr OnVolumechange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "volumechange", value: cb' (Cb (const value)) }
  mapAttr OnVolumechange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "volumechange", value: cb' (Cb (const value)) }

type OnVolumechangeEffect =
  forall element
   . Attr element OnVolumechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnVolumechange Unit where
  pureAttr OnVolumechange _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "volumechange", value: unset' }
  mapAttr OnVolumechange evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "volumechange", value: unset' }