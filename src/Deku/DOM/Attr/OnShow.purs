module Deku.DOM.Attr.OnShow where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnShow = OnShow

instance Attr anything OnShow Cb where
  attr OnShow bothValues = unsafeAttribute $ Both
    { key: "show", value: cb' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "show", value: cb' value })
  pureAttr OnShow value = unsafeAttribute $ This
    { key: "show", value: cb' value }
  unpureAttr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' value }

instance Attr anything OnShow (Effect Unit) where
  attr OnShow bothValues = unsafeAttribute $ Both
    { key: "show", value: cb' (Cb (const ((fst bothValues) $> true))) }
    ( snd bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnShow value = unsafeAttribute $ This
    { key: "show", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (Effect Boolean) where
  attr OnShow bothValues = unsafeAttribute $ Both
    { key: "show", value: cb' (Cb (const (fst bothValues))) }
    ( snd bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const value)) }
    )
  pureAttr OnShow value = unsafeAttribute $ This
    { key: "show", value: cb' (Cb (const value)) }
  unpureAttr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) }

type OnShowEffect =
  forall element. Attr element OnShow (Effect Unit) => Event (Attribute element)

instance Attr everything OnShow Unit where
  attr OnShow bothValues = unsafeAttribute $ Both { key: "show", value: unset' }
    (snd bothValues <#> \_ -> { key: "show", value: unset' })
  pureAttr OnShow _ = unsafeAttribute $ This { key: "show", value: unset' }
  unpureAttr OnShow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "show", value: unset' }
