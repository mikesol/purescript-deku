module Deku.DOM.Attr.XlinkHref where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkHref = XlinkHref

instance Attr AnimateTransform_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr AnimateTransform_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr AnimateTransform_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr AnimateTransform_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr AnimateTransform_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr FeImage_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr FeImage_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr FeImage_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr FeImage_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr FeImage_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Filter_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Filter_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Filter_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr Filter_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Filter_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Image_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Image_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Image_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr Image_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Image_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr LinearGradient_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr LinearGradient_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr LinearGradient_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr LinearGradient_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr LinearGradient_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Mpath_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Mpath_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Mpath_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr Mpath_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Mpath_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Pattern_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Pattern_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Pattern_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr Pattern_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Pattern_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr RadialGradient_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr RadialGradient_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr RadialGradient_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr RadialGradient_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr RadialGradient_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Use_ XlinkHref (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Use_ XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:href", value: prop' value })
instance Attr Use_ XlinkHref  String  where
  attr XlinkHref value = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: prop' value }
instance Attr Use_ XlinkHref (Event.Event  String ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:href", value: prop' value }

instance Attr Use_ XlinkHref (ST.ST Global.Global  String ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:href", value: prop' value }

instance Attr everything XlinkHref (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkHref bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:href", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:href", value: unset' })
instance Attr everything XlinkHref (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkHref (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "xlink:href", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:href", value: unset' })
instance Attr everything XlinkHref  Unit  where
  attr XlinkHref _ = unsafeAttribute $ This $ pure $
    { key: "xlink:href", value: unset' }
instance Attr everything XlinkHref (Event.Event  Unit ) where
  attr XlinkHref eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:href", value: unset' }

instance Attr everything XlinkHref (ST.ST Global.Global  Unit ) where
  attr XlinkHref iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "xlink:href", value: unset' }
