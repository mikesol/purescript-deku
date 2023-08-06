module Deku.DOM.Attr.XlinkTitle where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkTitle = XlinkTitle

instance Attr AnimateTransform_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr AnimateTransform_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr AnimateTransform_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr AnimateTransform_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr AnimateTransform_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr FeImage_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr FeImage_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr FeImage_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr FeImage_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr FeImage_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Filter_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Filter_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Filter_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr Filter_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Filter_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Image_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Image_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Image_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr Image_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Image_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr LinearGradient_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr LinearGradient_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr LinearGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr LinearGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr LinearGradient_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Mpath_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Mpath_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Mpath_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr Mpath_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Mpath_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Pattern_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Pattern_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr Pattern_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr Pattern_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr Pattern_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr RadialGradient_ XlinkTitle (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr RadialGradient_ XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:title", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:title", value: prop' value })
instance Attr RadialGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: prop' value }
instance Attr RadialGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }

instance Attr RadialGradient_ XlinkTitle (ST.ST Global.Global  String ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:title", value: prop' value }

instance Attr everything XlinkTitle (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkTitle bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:title", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:title", value: unset' })
instance Attr everything XlinkTitle (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkTitle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "xlink:title", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:title", value: unset' })
instance Attr everything XlinkTitle  Unit  where
  attr XlinkTitle _ = unsafeAttribute $ This $ pure $
    { key: "xlink:title", value: unset' }
instance Attr everything XlinkTitle (Event.Event  Unit ) where
  attr XlinkTitle eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:title", value: unset' }

instance Attr everything XlinkTitle (ST.ST Global.Global  Unit ) where
  attr XlinkTitle iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "xlink:title", value: unset' }
