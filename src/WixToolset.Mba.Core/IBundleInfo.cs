// Copyright (c) .NET Foundation and contributors. All rights reserved. Licensed under the Microsoft Reciprocal License. See LICENSE.TXT file in the project root for full license information.

namespace WixToolset.Mba.Core
{
    using System.Collections.Generic;

    public interface IBundleInfo
    {
        string LogVariable { get; }
        string Name { get; }
        IDictionary<string, IPackageInfo> Packages { get; }
        bool PerMachine { get; }

        IPackageInfo AddRelatedBundleAsPackage(DetectRelatedBundleEventArgs e);
    }
}