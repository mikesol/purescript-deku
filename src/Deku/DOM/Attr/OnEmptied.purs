module Deku.DOM.Attr.OnEmptied where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnEmptied = OnEmptied
instance Attr anything OnEmptied Cb where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' value }
instance Attr anything OnEmptied (Effect Unit) where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEmptied (Effect Boolean) where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' (Cb (const value)) }
instance Attr anything OnEmptied (Zora Unit) where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnEmptied (Zora Boolean) where
  attr OnEmptied value = unsafeAttribute { key: "emptied", value: cb' (Cb (const (runImpure value))) }