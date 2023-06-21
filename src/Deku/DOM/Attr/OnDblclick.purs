module Deku.DOM.Attr.OnDblclick where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDblclick = OnDblclick

instance Attr anything OnDblclick Cb where
  pureAttr OnDblclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "dblclick", value: cb' value }
  mapAttr OnDblclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (Effect Unit) where
  pureAttr OnDblclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDblclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (Effect Boolean) where
  pureAttr OnDblclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDblclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "dblclick", value: cb' (Cb (const value)) }

type OnDblclickEffect =
  forall element
   . Attr element OnDblclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDblclick Unit where
  pureAttr OnDblclick _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "dblclick", value: unset' }
