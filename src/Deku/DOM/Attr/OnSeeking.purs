module Deku.DOM.Attr.OnSeeking where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSeeking = OnSeeking

instance Attr anything OnSeeking Cb where
  pureAttr OnSeeking value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "seeking", value: cb' value }
  mapAttr OnSeeking evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "seeking", value: cb' value }

instance Attr anything OnSeeking (Effect Unit) where
  pureAttr OnSeeking value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSeeking evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seeking", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeking (Effect Boolean) where
  pureAttr OnSeeking value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSeeking evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seeking", value: cb' (Cb (const value)) }

type OnSeekingEffect =
  forall element
   . Attr element OnSeeking (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeking Unit where
  pureAttr OnSeeking _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "seeking", value: unset' }
