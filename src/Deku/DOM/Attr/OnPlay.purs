module Deku.DOM.Attr.OnPlay where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPlay = OnPlay

instance Attr anything OnPlay Cb where
  pureAttr OnPlay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "play", value: cb' value }
  mapAttr OnPlay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "play", value: cb' value }

instance Attr anything OnPlay (Effect Unit) where
  pureAttr OnPlay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPlay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "play", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlay (Effect Boolean) where
  pureAttr OnPlay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnPlay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "play", value: cb' (Cb (const value)) }

type OnPlayEffect =
  forall element. Attr element OnPlay (Effect Unit) => Event (Attribute element)

instance Attr everything OnPlay Unit where
  pureAttr OnPlay _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "play", value: unset' }
  mapAttr OnPlay evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "play", value: unset' }
