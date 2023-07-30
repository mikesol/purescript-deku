module Deku.DOM.Attr.OnSelect where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelect = OnSelect

instance Attr anything OnSelect Cb where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "select", value: cb' value })
  pureAttr OnSelect value = unsafeAttribute $ This
    { key: "select", value: cb' value }
  unpureAttr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' value }

instance Attr anything OnSelect (Effect Unit) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnSelect value = unsafeAttribute $ This
    { key: "select", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (Effect Boolean) where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const value)) }
    )
  pureAttr OnSelect value = unsafeAttribute $ This
    { key: "select", value: cb' (Cb (const value)) }
  unpureAttr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const value)) }

type OnSelectEffect =
  forall element
   . Attr element OnSelect (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelect Unit where
  attr OnSelect bothValues = unsafeAttribute $ Both
    { key: "select", value: unset' }
    (snd bothValues <#> \_ -> { key: "select", value: unset' })
  pureAttr OnSelect _ = unsafeAttribute $ This { key: "select", value: unset' }
  unpureAttr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "select", value: unset' }
