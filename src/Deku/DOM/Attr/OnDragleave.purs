module Deku.DOM.Attr.OnDragleave where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDragleave = OnDragleave

instance Attr anything OnDragleave Cb where
  pureAttr OnDragleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' value }
  mapAttr OnDragleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' value }

instance Attr anything OnDragleave (Effect Unit) where
  pureAttr OnDragleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' (Cb (const (value $> true))) }
  mapAttr OnDragleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragleave (Effect Boolean) where
  pureAttr OnDragleave value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' (Cb (const value)) }
  mapAttr OnDragleave evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dragleave", value: cb' (Cb (const value)) }

type OnDragleaveEffect =
  forall element
   . Attr element OnDragleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragleave Unit where
  pureAttr OnDragleave _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dragleave", value: unset' }

  mapAttr OnDragleave evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "dragleave", value: unset' }