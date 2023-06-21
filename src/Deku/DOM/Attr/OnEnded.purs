module Deku.DOM.Attr.OnEnded where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnEnded = OnEnded

instance Attr anything OnEnded Cb where
  pureAttr OnEnded value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "ended", value: cb' value }
  mapAttr OnEnded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "ended", value: cb' value }

instance Attr anything OnEnded (Effect Unit) where
  pureAttr OnEnded value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "ended", value: cb' (Cb (const (value $> true))) }
  mapAttr OnEnded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (Effect Boolean) where
  pureAttr OnEnded value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "ended", value: cb' (Cb (const value)) }
  mapAttr OnEnded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ended", value: cb' (Cb (const value)) }

type OnEndedEffect =
  forall element
   . Attr element OnEnded (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEnded Unit where
  pureAttr OnEnded _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "ended", value: unset' }
  mapAttr OnEnded evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "ended", value: unset' }
