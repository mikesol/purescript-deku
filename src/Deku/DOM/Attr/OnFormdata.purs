module Deku.DOM.Attr.OnFormdata where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnFormdata = OnFormdata

instance Attr anything OnFormdata Cb where
  pureAttr OnFormdata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "formdata", value: cb' value }
  mapAttr OnFormdata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "formdata", value: cb' value }

instance Attr anything OnFormdata (Effect Unit) where
  pureAttr OnFormdata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnFormdata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formdata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFormdata (Effect Boolean) where
  pureAttr OnFormdata value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnFormdata evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formdata", value: cb' (Cb (const value)) }

type OnFormdataEffect =
  forall element
   . Attr element OnFormdata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFormdata Unit where
  pureAttr OnFormdata _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formdata", value: unset' }
