module Deku.DOM.Attr.OnAuxclick where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick Cb where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "auxclick", value: cb' value })
  pureAttr OnAuxclick value = unsafeAttribute $ This
    { key: "auxclick", value: cb' value }
  unpureAttr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' value }

instance Attr anything OnAuxclick (Effect Unit) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnAuxclick value = unsafeAttribute $ This
    { key: "auxclick", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (Effect Boolean) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const value)) }
    )
  pureAttr OnAuxclick value = unsafeAttribute $ This
    { key: "auxclick", value: cb' (Cb (const value)) }
  unpureAttr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const value)) }

type OnAuxclickEffect =
  forall element
   . Attr element OnAuxclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAuxclick Unit where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: unset' }
    (snd bothValues <#> \_ -> { key: "auxclick", value: unset' })
  pureAttr OnAuxclick _ = unsafeAttribute $ This
    { key: "auxclick", value: unset' }
  unpureAttr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "auxclick", value: unset' }
