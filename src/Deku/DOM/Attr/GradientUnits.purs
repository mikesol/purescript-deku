module Deku.DOM.Attr.GradientUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr LinearGradient_ GradientUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr GradientUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "gradientUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr LinearGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: prop' value }
instance Attr LinearGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr LinearGradient_ GradientUnits (ST.ST Global.Global  String ) where
  attr GradientUnits iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr RadialGradient_ GradientUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr RadialGradient_ GradientUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr GradientUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "gradientUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr RadialGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: prop' value }
instance Attr RadialGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr RadialGradient_ GradientUnits (ST.ST Global.Global  String ) where
  attr GradientUnits iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr everything GradientUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "gradientUnits", value: unset' })
instance Attr everything GradientUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr GradientUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "gradientUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "gradientUnits", value: unset' })
instance Attr everything GradientUnits  Unit  where
  attr GradientUnits _ = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: unset' }
instance Attr everything GradientUnits (Event.Event  Unit ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "gradientUnits", value: unset' }

instance Attr everything GradientUnits (ST.ST Global.Global  Unit ) where
  attr GradientUnits iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "gradientUnits", value: unset' }
