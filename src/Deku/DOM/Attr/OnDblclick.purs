module Deku.DOM.Attr.OnDblclick where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnDblclick = OnDblclick

instance Attr anything OnDblclick Cb where
  attr OnDblclick value = unsafeAttribute { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (Effect Unit) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (Effect Boolean) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const value)) }

instance Attr anything OnDblclick (Zora Unit) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnDblclick (Zora Boolean) where
  attr OnDblclick value = unsafeAttribute
    { key: "dblclick", value: cb' (Cb (const (runImpure value))) }