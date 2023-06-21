module Deku.DOM.Attr.OnPause where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPause = OnPause

instance Attr anything OnPause Cb where
  pureAttr OnPause value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "pause", value: cb' value }
  mapAttr OnPause evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "pause", value: cb' value }

instance Attr anything OnPause (Effect Unit) where
  pureAttr OnPause value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pause", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPause evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (Effect Boolean) where
  pureAttr OnPause value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pause", value: cb' (Cb (const value)) }
  mapAttr OnPause evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pause", value: cb' (Cb (const value)) }

type OnPauseEffect =
  forall element
   . Attr element OnPause (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPause Unit where
  pureAttr OnPause _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "pause", value: unset' }
  mapAttr OnPause evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pause", value: unset' }
