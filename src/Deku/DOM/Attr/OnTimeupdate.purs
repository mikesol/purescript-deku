module Deku.DOM.Attr.OnTimeupdate where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate Cb where
  pureAttr OnTimeupdate value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTimeupdate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "timeupdate", value: cb' value }

instance Attr anything OnTimeupdate (Effect Unit) where
  pureAttr OnTimeupdate value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTimeupdate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "timeupdate", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTimeupdate (Effect Boolean) where
  pureAttr OnTimeupdate value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTimeupdate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "timeupdate", value: cb' (Cb (const value)) }

type OnTimeupdateEffect =
  forall element
   . Attr element OnTimeupdate (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTimeupdate Unit where
  pureAttr OnTimeupdate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "timeupdate", value: unset' }
