module Deku.DOM.Attr.OnContextmenu where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnContextmenu = OnContextmenu

instance Attr anything OnContextmenu Cb where
  pureAttr OnContextmenu value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnContextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: cb' value }

instance Attr anything OnContextmenu (Effect Unit) where
  pureAttr OnContextmenu value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnContextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnContextmenu (Effect Boolean) where
  pureAttr OnContextmenu value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnContextmenu evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "contextmenu", value: cb' (Cb (const value)) }

type OnContextmenuEffect =
  forall element
   . Attr element OnContextmenu (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnContextmenu Unit where
  pureAttr OnContextmenu _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "contextmenu", value: unset' }
