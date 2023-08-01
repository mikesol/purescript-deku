module Deku.DOM.Attr.OnSelectstart where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart Cb where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "selectstart", value: cb' value })
  pureAttr OnSelectstart value = unsafeAttribute $ This
    { key: "selectstart", value: cb' value }
  unpureAttr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (Effect Unit) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnSelectstart value = unsafeAttribute $ This
    { key: "selectstart", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (Effect Boolean) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const value)) }
    )
  pureAttr OnSelectstart value = unsafeAttribute $ This
    { key: "selectstart", value: cb' (Cb (const value)) }
  unpureAttr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const value)) }

type OnSelectstartEffect =
  forall element
   . Attr element OnSelectstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelectstart Unit where
  attr OnSelectstart bothValues = unsafeAttribute $ Both
    { key: "selectstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "selectstart", value: unset' })
  pureAttr OnSelectstart _ = unsafeAttribute $ This
    { key: "selectstart", value: unset' }
  unpureAttr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "selectstart", value: unset' }
