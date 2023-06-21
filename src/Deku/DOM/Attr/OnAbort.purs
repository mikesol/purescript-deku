module Deku.DOM.Attr.OnAbort where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAbort = OnAbort

instance Attr anything OnAbort Cb where
  pureAttr OnAbort value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "abort", value: cb' value }
  mapAttr OnAbort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "abort", value: cb' value }

instance Attr anything OnAbort (Effect Unit) where
  pureAttr OnAbort value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAbort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (Effect Boolean) where
  pureAttr OnAbort value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAbort evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "abort", value: cb' (Cb (const value)) }

type OnAbortEffect =
  forall element
   . Attr element OnAbort (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAbort Unit where
  pureAttr OnAbort _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "abort", value: unset' }
  mapAttr OnAbort evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "abort", value: unset' }
