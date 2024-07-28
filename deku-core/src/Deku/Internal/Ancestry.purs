module Deku.Internal.Ancestry
  ( root
  , element
  , dyn
  , portal
  , fixed
  , toStringRepresentationInDOM
  , unsafeFakeAncestry
  , Ancestry
  ) where

import Prelude

data DekuAncestry
  = Element Int DekuAncestry
  | Dyn Int DekuAncestry
  | Portal DekuAncestry
  | Fixed Int DekuAncestry
  | Root

data Ancestry = RealAncestry { rep :: String, lineage :: DekuAncestry } | FakeAncestry { rep :: String }

instance Eq Ancestry where
  eq (RealAncestry a) (RealAncestry b) = a.rep == b.rep
  eq (FakeAncestry a) (FakeAncestry b) = a.rep == b.rep
  eq (RealAncestry a) (FakeAncestry b) = a.rep == b.rep
  eq (FakeAncestry a) (RealAncestry b) = a.rep == b.rep

instance Ord Ancestry where
  compare (RealAncestry a) (RealAncestry b) = compare a.rep b.rep
  compare (FakeAncestry a) (FakeAncestry b) = compare a.rep b.rep
  compare (RealAncestry a) (FakeAncestry b) = compare a.rep b.rep
  compare (FakeAncestry a) (RealAncestry b) = compare a.rep b.rep

root :: Ancestry
root = RealAncestry { rep: "", lineage: Root }

element :: Int -> Ancestry -> Ancestry
element i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "e" <> show i, lineage: Element i a.lineage }
element i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "e" <> show i  }

dyn :: Int -> Ancestry -> Ancestry
dyn i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "d" <> show i, lineage: Dyn i a.lineage }
dyn i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "d" <> show i  }

portal :: Ancestry -> Ancestry
portal (RealAncestry a) = RealAncestry
  { rep: a.rep <> "p", lineage: Portal a.lineage }
portal (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "p" }

fixed :: Int -> Ancestry -> Ancestry
fixed i (RealAncestry a) = RealAncestry
  { rep: a.rep <> "f" <> show i, lineage: Fixed i a.lineage }
fixed i (FakeAncestry a) = FakeAncestry
  { rep: a.rep <> "f" <> show i  }

toStringRepresentationInDOM :: Ancestry -> String
toStringRepresentationInDOM (RealAncestry { rep }) = rep
toStringRepresentationInDOM (FakeAncestry { rep }) = rep

unsafeFakeAncestry :: String -> Ancestry
unsafeFakeAncestry rep = FakeAncestry { rep }