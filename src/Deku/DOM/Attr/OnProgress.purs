module Deku.DOM.Attr.OnProgress where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnProgress = OnProgress

instance Attr anything OnProgress Cb where
  pureAttr OnProgress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "progress", value: cb' value }
  mapAttr OnProgress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "progress", value: cb' value }

instance Attr anything OnProgress (Effect Unit) where
  pureAttr OnProgress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnProgress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (Effect Boolean) where
  pureAttr OnProgress value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnProgress evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "progress", value: cb' (Cb (const value)) }

type OnProgressEffect =
  forall element
   . Attr element OnProgress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnProgress Unit where
  pureAttr OnProgress _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "progress", value: unset' }
