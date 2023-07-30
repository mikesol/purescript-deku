module Deku.DOM.Attr.OnEmptied where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEmptied = OnEmptied

instance Attr anything OnEmptied Cb where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "emptied", value: cb' value })
  pureAttr OnEmptied value = unsafeAttribute $ This
    { key: "emptied", value: cb' value }
  unpureAttr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (Effect Unit) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnEmptied value = unsafeAttribute $ This
    { key: "emptied", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (Effect Boolean) where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "emptied", value: cb' (Cb (const value)) }
    )
  pureAttr OnEmptied value = unsafeAttribute $ This
    { key: "emptied", value: cb' (Cb (const value)) }
  unpureAttr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "emptied", value: cb' (Cb (const value)) }

type OnEmptiedEffect =
  forall element
   . Attr element OnEmptied (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEmptied Unit where
  attr OnEmptied bothValues = unsafeAttribute $ Both
    { key: "emptied", value: unset' }
    (snd bothValues <#> \_ -> { key: "emptied", value: unset' })
  pureAttr OnEmptied _ = unsafeAttribute $ This
    { key: "emptied", value: unset' }
  unpureAttr OnEmptied eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "emptied", value: unset' }
